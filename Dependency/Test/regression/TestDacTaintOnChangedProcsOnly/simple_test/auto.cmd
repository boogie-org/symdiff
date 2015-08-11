run_symdiff_bpl.cmd v0 v1 /rvt /opts:" -usemutual -asserts -checkEquivWithDependencies -freeContracts -dacEncodingLinear -dacConsiderChangedProcOnly " /changedLines 

!echo off

#--------------------
#Expected output (with -dacConsiderChangedProcOnly in v0v1.log)
#--------------------
#Dropping implementations due to dacConsiderChanged option [_v2.$init_funcs,_v2.$static_init,_v2.a,_v2.b,_v2.main,_v1.$init_funcs,_v1.$static_init,_v1.a,_v1.b,_v1.main,MS_Check__v1.$init_funcs___v2.$init_funcs,MS_Check__v1.$static_init___v2.$static_init,MS_Check__v1.a___v2.a,MS_Check__v1.main___v2.main]
#Houdini statistics:: Prover Time 0.0419244 NumProver Queries 3 UnsatProver time 0.0049463 NumUnsat prunings 0
#Houdini finished and inferred 43/53 contracts
#Houdini finished with 1 verified, 0 errors, 0 inconclusives, 0 timeouts

#--------------------
#Expected output (without -dacConsiderChangedProcOnly in v0v1.log)
#--------------------
#Pruning impls with no non-free contract transitively: _v2.$init_funcs
#Pruning impls with no non-free contract transitively: _v2.$static_init
#Pruning impls with no non-free contract transitively: _v2.a
#Pruning impls with no non-free contract transitively: _v2.b
#Pruning impls with no non-free contract transitively: _v2.main
#Pruning impls with no non-free contract transitively: _v1.$init_funcs
#Pruning impls with no non-free contract transitively: _v1.$static_init
#Pruning impls with no non-free contract transitively: _v1.a
#Pruning impls with no non-free contract transitively: _v1.b
#Pruning impls with no non-free contract transitively: _v1.main
#Houdini statistics:: Prover Time 0.0408937 NumProver Queries 6 UnsatProver time 0.0130583 NumUnsat prunings 1
#Houdini finished and inferred 52/53 contracts
#Houdini finished with 5 verified, 0 errors, 0 inconclusives, 0 timeouts

