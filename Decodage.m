function solution = Decodage(chromosome, probleme)
% chromosome : an array;
% probleme: [c1,c2,c3...]
% c_i: structure having min, max, bits, pos.
    nb_composant = length(probleme);
    solution = zeros(1,length(probleme));
    for i=1:length(probleme)
        c_i = probleme{i};
        min = c_i.min;
        max = c_i.max;
        bits = c_i.bits;
        pos = c_i.pos;
        
        bin = chromosome(pos:(pos+bits-1)); % get composant bits
        
        idx = 0; % find decimal value
        for k=1:length(bin)
            idx = idx + 2^(k-1)*bin(k);           
        end
        
        resolution = (max - min)/2^(bits);
        
        solution(i) = min+idx*resolution;      
    end
end