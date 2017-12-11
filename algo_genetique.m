function solution_finale = algo_genetique(I, P, tc, tm, problem)
% I : nombre d'itérations
% P : polulation
% problem : pour décodage
% tc : taux de crossover
% tm : taux de mutation
p = P;
for i=1:I
   p = crossover(tc,p,tm, problem);
end
solution_finale = p;
end
