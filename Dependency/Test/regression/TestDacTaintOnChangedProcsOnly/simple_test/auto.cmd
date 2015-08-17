call run_symdiff_bpl.cmd v0 v1 /rvt /opts:" -usemutual -asserts -checkEquivWithDependencies -freeContracts -dacEncodingLinear -dacConsiderChangedProcsUptoDistance:0 " /changedLines > v0v1_0.log

@echo off
REM Dropping implementations due to dacConsiderChanged option [_v2.$init_funcs,_v2.$static_init,_v2.a,_v2.b,_v2.main,_v1.$init_funcs,_v1.$static_init,_v1.a,_v1.b,_v1.main,MS_Check__v1.$init_funcs___v2.$init_funcs,MS_Check__v1.$static_init___v2.$static_init,MS_Check__v1.a___v2.a,MS_Check__v1.main___v2.main]
REM Analyzing the list of implementations = [MS_Check__v1.b___v2.b]
REM Houdini statistics:: Prover Time 0.0429557 NumProver Queries 4 UnsatProver time 0.0040003 NumUnsat prunings 0
REM Houdini finished and inferred 1/14 contracts
REM Houdini finished with 1 verified, 0 errors, 0 inconclusives, 0 timeouts
REM Generated mergedProgSingle.bpl 
 

@echo on
call run_symdiff_bpl.cmd v0 v1 /rvt /opts:" -usemutual -asserts -checkEquivWithDependencies -freeContracts -dacEncodingLinear -dacConsiderChangedProcsUptoDistance:1 " /changedLines > v0v1_1.log

@echo off
REM Dropping implementations due to dacConsiderChanged option [_v2.$init_funcs,_v2.$static_init,_v2.a,_v2.b,_v2.main,_v1.$init_funcs,_v1.$static_init,_v1.a,_v1.b,_v1.main,MS_Check__v1.$init_funcs___v2.$init_funcs,MS_Check__v1.$static_init___v2.$static_init]
REM Analyzing the list of implementations = [MS_Check__v1.a___v2.a,MS_Check__v1.b___v2.b,MS_Check__v1.main___v2.main]
REM Houdini statistics:: Prover Time 0.0549779 NumProver Queries 10 UnsatProver time 0.0151274 NumUnsat prunings 1
REM Houdini finished and inferred 34/39 contracts
REM Houdini finished with 3 verified, 0 errors, 0 inconclusives, 0 timeouts
REM Generated mergedProgSingle.bpl 

@echo on
call run_symdiff_bpl.cmd v0 v1 /rvt /opts:" -usemutual -asserts -checkEquivWithDependencies -freeContracts -dacEncodingLinear -dacConsiderChangedProcsUptoDistance:2 " /changedLines > v0v1_2.log

@echo off
REM Dropping implementations due to dacConsiderChanged option [_v2.$init_funcs,_v2.$static_init,_v2.a,_v2.b,_v2.main,_v1.$init_funcs,_v1.$static_init,_v1.a,_v1.b,_v1.main]
REM Analyzing the list of implementations = [MS_Check__v1.$init_funcs___v2.$init_funcs,MS_Check__v1.$static_init___v2.$static_init,MS_Check__v1.a___v2.a,MS_Check__v1.b___v2.b,MS_Check__v1.main___v2.main]
REM Houdini statistics:: Prover Time 0.0538635 NumProver Queries 12 UnsatProver time 0.0170917 NumUnsat prunings 1
REM Houdini finished and inferred 34/39 contracts
REM Houdini finished with 5 verified, 0 errors, 0 inconclusives, 0 timeouts
REM Generated mergedProgSingle.bpl 


