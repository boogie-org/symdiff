//#define DBG

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using Microsoft.Boogie.GraphUtil;
using System.Diagnostics;

namespace Dependency
{

    // some of the WorkList algorithm was exported to this class as it is the same for Dependency and Taint
    public class WorkList<AbsState> where AbsState : IAbstractState, new()
    {
        // Command -> Abstract State
        public Dictionary<Absy, AbsState> stateSpace = new Dictionary<Absy, AbsState>();
        internal List<Absy> workList = new List<Absy>();
        internal Dictionary<Absy, Block> cmdBlocks = new Dictionary<Absy, Block>();
        internal Dictionary<Procedure, HashSet<CallCmd>> procCallers = new Dictionary<Procedure, HashSet<CallCmd>>();

        internal AbsState GatherPredecessorsState(Absy node, Block currBlock)
        {
            AbsState state = default(AbsState);
            if (node is Cmd)
            {
                int index = currBlock.Cmds.IndexOf((Cmd)node);
                if (index == 0)
                    state = GatherBlockPredecessorsState(currBlock);
                else if (stateSpace.ContainsKey(currBlock.Cmds[index - 1]))
                    state = (AbsState)stateSpace[currBlock.Cmds[index - 1]].Clone();
                else
                    state = new AbsState();
            }
            else if (node is TransferCmd)
            {
                if (currBlock.Cmds.Count == 0)
                    state = GatherBlockPredecessorsState(currBlock);
                else
                    state = (AbsState)stateSpace[currBlock.Cmds.Last()].Clone();
            }
            else
                throw new ArgumentException("Unknown node type: " + node);
            return state;
        }

        internal AbsState GatherBlockPredecessorsState(Block currBlock)
        {
            var state = new AbsState();

            foreach (var pred in currBlock.Predecessors)
            {
                var cmd = (pred.Cmds.Count > 0) ? (Absy)pred.Cmds.Last() : (Absy)pred.TransferCmd;
                if (stateSpace.ContainsKey(cmd))
                    state.JoinWith(stateSpace[cmd]);
            }
            return state;
        }

        // returns whether a propagation occured
        internal bool Assign(Absy node, AbsState state)
        {
            Block block = cmdBlocks[node];

            var callNode = (node as CallCmd);
            if (callNode != null) // maintain procCallers
            {
                var callee = callNode.Proc;
                if (!procCallers.ContainsKey(callee))
                    procCallers[callee] = new HashSet<CallCmd>();
                procCallers[callee].Add(callNode);
            }

            // if the new state for the node is different, add all succesors to the worklist
            if (!stateSpace.ContainsKey(node))
                stateSpace[node] = state;
            else if (!stateSpace[node].JoinWith(state))
                return false;
            return true;
        }

        internal void Propagate(Absy node)
        {
            Block block = cmdBlocks[node];
            if (node is Cmd)
            {
                int index = block.Cmds.IndexOf(node as Cmd);
                Absy cmd = (index < block.Cmds.Count - 1) ? block.Cmds[index + 1] : cmd = block.TransferCmd;
                workList.Add(cmd);
                cmdBlocks[cmd] = block;
            }
            else if (node is GotoCmd)
            {
                foreach (var succ in (node as GotoCmd).LabelTargets)
                {
                    Absy cmd;
                    if (succ.Cmds.Count > 0)
                        cmd = succ.Cmds[0];
                    else
                        cmd = succ.TransferCmd; // some blocks are just a goto
                    workList.Add(cmd);
                    cmdBlocks[cmd] = succ;
                }
            }
            else
            {
                Console.WriteLine("Error in WorkList: Propagating state for " + node);
                Debug.Assert(false);
            }
        }

        internal void Propagate(ReturnCmd node, Procedure caller)
        {
            if (procCallers.ContainsKey(caller))
                foreach (var cs in procCallers[caller])
                    workList.Add(cs);
        }

        // this is a simple transformer for a command that has no effect on the state
        internal Absy SimpleTransform(Absy node)
        {
            if (Assign(node, GatherPredecessorsState(node, cmdBlocks[node])))
                Propagate(node);
            return node;
        }

        internal void RunFixedPoint(DependencyVisitor visitor, Implementation node)
        {
            Dictionary<Absy, int> visitCount = new Dictionary<Absy, int>();
            //VarSet.allSets.Clear();
            Absy entry = Utils.GetImplEntry(node);
            workList.Add(entry);
            cmdBlocks[entry] = node.Blocks[0];
            while (workList.Count > 0)
            {
                var cmd = workList[0];
                workList.RemoveAt(0);
//#if DBG
                if (!visitCount.Keys.Contains(cmd))
                    visitCount[cmd] = 0;
                ++visitCount[cmd];
                //Console.WriteLine("Visiting (" + visitCount[cmd] + ") L" + cmd.Line + ": " + cmd);
//#endif
                //if (cmd is ReturnCmd || visitCount[cmd] <= 1)
                //if (visitCount[cmd] < 5)
                visitor.Visit(cmd);
                //else
                //{
                //    stateSpace[cmd].SetTop(node);
                //    if (!(cmd is ReturnCmd))
                //        Propagate(cmd);
                //}
                //else
                    //SimpleTransform(cmd);
                //Console.WriteLine("State size is {0} (over {1} program locations)", stateSpace.Sum(s => (s.Value as Dependencies).Sum(vd => vd.Value.Count)), stateSpace.Keys.Count);
#if DBG
                    if (stateSpace.ContainsKey(cmd))
                        Console.WriteLine(stateSpace[cmd].ToString());
                    Console.ReadLine();
#endif
            }
            //HashSet<Dependencies> deps = new HashSet<Dependencies>();
            //int redundant = 0, overall = 0;
            //stateSpace.Values.ForEach(d => { var dd = d as Dependencies; if (!deps.Add(dd)) redundant++; });
            //Console.WriteLine("{0} redundant dependiences in {1} locations", redundant, stateSpace.Keys.Count);
            //HashSet<VarSet> sets = new HashSet<VarSet>();
            //stateSpace.Values.ForEach(d => (d as Dependencies).Values.ForEach(s => { overall++; if (sets.Any(ss => ss.SetEquals(s))) redundant++; sets.Add(s); }));
            //Console.WriteLine("{0} redundant var sets out of {1}, size of allsets = {2}", redundant, overall, VarSet.allSets.Count);
        }
    }

}
