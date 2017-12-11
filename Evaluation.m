function fitness = Evaluation (solution)
fitness = 1.0/(sum(solution)^2+0.0001);
end