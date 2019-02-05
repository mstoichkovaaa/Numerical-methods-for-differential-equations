function [minAlphaSecond, maxAlphaSecond, minAlphaThird ,maxAlphaThird ] = convergence(func, x0, xEnd, h, u0)

[~, y2h]  = secondOrderRK(func, x0, xEnd, ceil( (xEnd-x0)/h ), u0);
[~, y2h2] = secondOrderRK(func, x0, xEnd, ceil( (2*(xEnd-x0)/h) ), u0);
[~, y2h4] = secondOrderRK(func, x0, xEnd, ceil( (4*(xEnd-x0)/h) ), u0);

y2h2      = y2h2( 1 : 2 : length( y2h2 ));
y2h4      = y2h4( 1 : 4 : length( y2h4 ));

[~, y3h]  = thirdOrderRK(func, x0, xEnd, ceil( (xEnd-x0)/h ), u0);
[~, y3h2] = thirdOrderRK(func, x0, xEnd, ceil( (2*(xEnd-x0))/h ), u0);
[~, y3h4] = thirdOrderRK(func, x0, xEnd, ceil( (4*(xEnd-x0))/h ), u0);

y3h2      = y3h2( 1 : 2 : length( y3h2 ));
y3h4      = y3h4( 1 : 4 : length( y3h4 ));


alphaSecondOrder = log(abs( (y2h - y2h2) / (y2h2 - y2h4) )) / log(2);
minAlphaSecond   = min( alphaSecondOrder );
maxAlphaSecond   = max( alphaSecondOrder );

alphaThirdOrder  = log(abs( (y3h - y3h2) / (y3h2 - y3h4))) / log(2);
minAlphaThird    = min( alphaThirdOrder );
maxAlphaThird    = max( alphaThirdOrder );

end