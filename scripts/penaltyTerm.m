function penalty = penaltyTerm(value)
        weightFactor = 100;
        penalty = abs(value) * weightFactor;
end