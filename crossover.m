function now = crossover(tau_c,prev,tm, probleme)
%entrée : 
% P [#chromosome, bits]
% tau_c : probabilité crossover
% tm : probabilité mutation
%sortie :
% p: nouvelle générations, on rejette toute la génération précédente
    now =[];
    
    %selection
    fitness = zeros(size(prev,1),1);
    for i=1:size(prev,1)
        solution = Decodage(prev(i,:), probleme);
        fitness(i) = Evaluation (solution);
    end
    fitness;
    prob = abs(fitness./sum(fitness));
    cum_prob = cumsum(prob);
    cum_prob = [0;cum_prob];
    %roulette
    while(size(now,1) < (floor(size(prev,1)/2)*2))
        parents = [];
        while size(parents,1)~= 2
            r = rand;
            for i=2:(length(cum_prob)-1)
                if (r >= cum_prob(i-1,1) && r <= cum_prob(i,1))  % do not write min <= r <= max
                    parents = [parents;prev(i-1,:)];
                    break;
                end
            end
        end
        
        %corssover
        prob = rand;
        c1 = parents(1,:);
        c2 = parents(2,:);
        if prob <= tau_c
            coupure = randi(length(c1)-1);
            tmp = c1(1:coupure);
            c1(1:coupure) = c2(1:coupure);
            c2(1:coupure) = tmp;

            % mutation
            prob = rand;
            if prob < tm
                
                mutation_idx = randi(size(c1,2)-1);
                c1(mutation_idx) = 1- c1(mutation_idx);
                mutation_idx = randi(size(c2,2)-1);
                c2(mutation_idx) = 1- c2(mutation_idx);
            end
            now = [now;c1;c2];
        end
    end
end