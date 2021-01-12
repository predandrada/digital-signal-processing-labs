function normalized = normalize(image)
    min_val = min(min(image));
    max_val = max(max(image));
    diff = max_val - min_val;
    normalized = (image - min_val)/diff;
end

