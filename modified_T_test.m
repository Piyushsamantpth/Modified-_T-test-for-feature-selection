function [t_score,Index,feature_sorted]=modified_T_test(feature_set,target)


% % this function used modified t-test feature selection method
% % output-----t-score their score and final sorted vector as an output ,
% % input----- feature set and target as 
% % clear all(length(target)));




[total_subjects total_features]=size(feature_set);
classes=unique(target);
[no_of_classes ~]=size(classes); 
t_of_each_class=[];
t_score=[];
SI=[];
as=[];
lol=[];
class_mean=[];
no_of_sub_each_class=[];
Mc=[];
                for i=1:no_of_classes
                n = sum( target==classes(i,:));    %no of subjects in the first classes 
                no_of_sub_each_class=[no_of_sub_each_class n];
                end
 
for i=1: total_features
    q=feature_set(:,i);
    mean_x=mean(q);  %mean of all components of feature column
    for j=1:no_of_classes
    [u v]=find(target==classes(j,1));
        for k=1:length(u)
        s=q(u(k,1));
        as=[as s]; 
        %b=mean (as)
        end
        b=mean (as);
    class_mean=[class_mean b];
    M=[1/no_of_sub_each_class(1,j)-1/total_subjects]^.5;
    Mc=[Mc M];
            for k=1:length(u)
            lo=(as(1,k)-b)^2;
            lol=[lol lo];
            %lol=lol.^2;
            end
    as=[];
    %class_mean=[class_mean b]
    end
qw=1/(total_subjects-no_of_classes);
S=qw*sum(lol);
            for wq=1:length(class_mean)
                t_of_each_class=[];
            tc=(class_mean(1,wq)-mean_x)/ Mc(1,wq)*S;
            t_of_each_class=[t_of_each_class tc];
            end       
            t_feature=max(t_of_each_class);
            t_score=[t_score t_feature];           
end
feature_sorted=[];
[score, Index]=sort(t_score,'descend');
for i=1: length(Index)
    feature_al=feature_set(:,Index(1,i));
    feature_sorted=[feature_sorted feature_al];
end
    