clear;


root_dir = fullfile('ds');

mkdir ds_rz;
out_dir = fullfile('ds_rz\');

mkdir ([out_dir 'rgb_dir']);
mkdir ([out_dir 'lbl_dir']);

rgb_dir = fullfile(out_dir,'rgb_dir\');
lbl_dir = fullfile(out_dir,'lbl_dir\');


sz= [240 320];

sets = 1;
i_name=1;
ext = ".png";
for i=1:sets
    set_dir = fullfile(root_dir,"set"+num2str(i));%set directory

    img_dir = fullfile(set_dir,"img");%subdurectory of images
    lab_dir = fullfile(set_dir,"lab");%             of labels

    img_dstore = imageDatastore(img_dir);
    lab_dstore = imageDatastore(lab_dir); 

    for n=1:size(img_dstore.Files,1)
        im = imread(img_dstore.Files{n});
        mk = imread(lab_dstore.Files{n});
        
        if(size(im,1)>size(im,2))
            im = imrotate(im,90);
            mk = imrotate(mk,90);
        end
        
        im=imresize(im,sz);
        mk=imresize(mk,sz);
        
        mk = imbinarize(mk);
        
        imwrite(im,fullfile(rgb_dir,num2str(i_name)+ext));
        imwrite(mk,fullfile(lbl_dir,num2str(i_name)+ext));
        
        i_name = i_name + 1;
    end
end