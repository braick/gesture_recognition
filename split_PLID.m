function [test_PLID,val_PLID,train_PLID] = split_PLID(PLID,test,val,train)
    
    if(test+val+train~=1)
       error("Los ratios deben sumar uno"); 
    end
    
    sz = size(PLID.Images,1);
    
    rand_vect = randperm(sz);
    
    test_index=  floor(test*sz);
    val_index = floor(val*sz);
    
    test_PLID = partitionByIndex(PLID,rand_vect(1:test_index));
    val_PLID = partitionByIndex(PLID,rand_vect(test_index+1:test_index+val_index));
    train_PLID = partitionByIndex(PLID,rand_vect(test_index+val_index+1:end));
    
    
    
    
    
end

