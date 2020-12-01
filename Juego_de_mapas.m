Score=0;
Countries=randperm(13);
mymap=[0    0.4470    0.7410
    0.8500    0.3250    0.0980
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.4660    0.6740    0.1880
    0.3010    0.7450    0.9330
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.3010    0.7450    0.9330
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.4660    0.6740    0.1880
    0.3010    0.7450    0.9330
    0.6350    0.0780    0.1840
         0    0.4470    0.7410];
prompt='Do you want to play a game? (Y to continue)';
answer=input(prompt, 's');
tf=strcmpi(answer,'Y');
if tf==1
    for round=1:13
        Question=Countries(round);
        mymap=[0    0.4470    0.7410
        0.8500    0.3250    0.0980
        0.9290    0.6940    0.1250
        0.4940    0.1840    0.5560
        0.4660    0.6740    0.1880
        0.3010    0.7450    0.9330
        0.9290    0.6940    0.1250
        0.4940    0.1840    0.5560
        0.3010    0.7450    0.9330
        0.9290    0.6940    0.1250
        0.4940    0.1840    0.5560
        0.4660    0.6740    0.1880
        0.3010    0.7450    0.9330
        0.6350    0.0780    0.1840
         0    0.4470    0.7410];
        mymap((Question+1), 1:3)=[0 0 0];
        image(map),colormap(mymap);text(500,900,'1. Brazil'); text(500,950,'2. Argentina'); text(500,1000,'3. Uruguay'); text(500,1050,'4. Paraguay'); text(500,1100,'5. Colombia');text(500,1150,'6. French Guyana'); text(500,1200,'7. Suriname'); text(650,900,'8. Guyana'); text(650,950,'9. Equador'); text(650,1000,'10. Peru'); text(650,1050,'11. Chile'); text(650,1100,'12. Bolivia'); text(650,1150,'13. Venezuela');axis('off')
        prompt='Which country is blacked out? (1-13)  ';
        answer=input(prompt);
        if answer==Question
            Score=Score+1;
        end
    end
    Score=num2str(Score);
    ['Your score is ' , Score, ' out of 13.']
else
     'Sorry, please try again.';
end