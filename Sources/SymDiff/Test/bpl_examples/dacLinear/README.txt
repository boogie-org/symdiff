The example distinguishes the use of dacEncodingLinear

Using -dacEncodingLinear will fail to prove output of Bar equal, but without it they can be shown equal.


* /rvt /opts:" -usemutual -checkEquivWithDependencies -freeContracts " 

* /rvt /opts:" -usemutual -checkEquivWithDependencies -freeContracts -dacEncodingLinear " 
