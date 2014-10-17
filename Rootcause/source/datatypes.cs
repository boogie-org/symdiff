using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Boogie;
using Microsoft.Boogie.VCExprAST;
using VC;
using Microsoft.Basetypes;
using BType = Microsoft.Boogie.Type;

namespace Rootcause
{
    public class Datatypes
    {

        /* datatypes */
        static public CtorType dtType;
        static public MapType dtSetType;
        static public Constant emptyConstant;
        static public DatatypeConstructor nilConstructor;
        static public DatatypeConstructor intConstructor;
        static public DatatypeConstructor boolConstructor;
        static public DatatypeConstructor havocConstructor;
        static public Function singleFunction;
        static public Function unionFunction;
        static public Function setFunction;
        static public Dictionary<string, DatatypeConstructor> functionToConstructor = new Dictionary<string, DatatypeConstructor>();

        #region Prelude axioms
        static public string prelude =
            // Define the type __DT to represent the result of an uninterpreted function call.
            // Associate sets of __DT elements (type [__DT]bool) with each value to represent the
            // each value's set of dependencies on uninterpreted function calls.
            // Example, where U1 and U2 are uninterpreted and + is interpreted:
            //      y1 := U1(x1);
            //      y2 := U2(x2);
            //      y := y1 + y2;
            //  ==>
            //      __DT__y1 := __DT_Single(__DT__U1(__DT_Set(__DT__x1)));
            //      __DT__y2 := __DT_Single(__DT__U2(__DT_Set(__DT__x2)));
            //      __DT__y := __DT_Union(__DT__y1, __DT__y2);
            @"
            type {:datatype} __DT;
            function {:constructor} __DT_nil():__DT;
            function {:constructor} __DT_int(x:int):__DT;
            function {:constructor} __DT_bool(x:bool):__DT;
            function {:constructor} __DT_havoc():__DT;
            const __DT_Empty:[__DT]bool;
            function __DT_Single(x:__DT):[__DT]bool;
            function __DT_Union(x:[__DT]bool, y:[__DT]bool):[__DT]bool { if x == __DT_Empty then y else if y == __DT_Empty || x == y then x else __DT_Union2(x, y) }
            function __DT_Union2(x:[__DT]bool, y:[__DT]bool):[__DT]bool;
            function __DT_Sig(x:[__DT]bool):int;
            function __DT_Set(x:[__DT]bool):__DT { __DT_int(__DT_Sig(x)) }
            ";
        static public string preludeSetAxiomsBase =
            @"
            axiom (forall i:__DT::{__DT_Empty[i]} !__DT_Empty[i]);
            axiom (forall x:__DT, i:__DT::{__DT_Single(x)[i]} __DT_Single(x)[i] <==> x == i);
            axiom (forall x:__DT::{__DT_Single(x)} __DT_Single(x)[x]);
            axiom (forall x1:[__DT]bool, x2:[__DT]bool, i:__DT::{__DT_Union2(x1, x2)[i]} __DT_Union2(x1, x2)[i] <==> x1[i] || x2[i]);
            axiom (forall x1:[__DT]bool, x2:[__DT]bool, i:__DT::{__DT_Union2(x1, x2), x1[i]} x1[i] ==> __DT_Union2(x1, x2)[i]);
            axiom (forall x1:[__DT]bool, x2:[__DT]bool, i:__DT::{__DT_Union2(x1, x2), x2[i]} x2[i] ==> __DT_Union2(x1, x2)[i]);
            ";
        static public string preludeSetAxiomsMin = preludeSetAxiomsBase +
            @"
            axiom (forall x1:[__DT]bool, x2:[__DT]bool::{__DT_Sig(x1), __DT_Sig(x2)}
                    __DT_Sig(x1) == __DT_Sig(x2) ==> x1 == x2);
            ";
        static public string preludeSetAxioms = preludeSetAxiomsBase +
            @"
            axiom (forall x1:[__DT]bool, x2:[__DT]bool::{__DT_Sig(x1), __DT_Sig(x2)}
                    (forall i:__DT::{x1[i]}{x2[i]} x1[i] == x2[i]) <==> __DT_Sig(x1) == __DT_Sig(x2));
            ";
        #endregion
    }
}
