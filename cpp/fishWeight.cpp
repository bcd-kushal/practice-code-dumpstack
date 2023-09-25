int totalFishWeight(vector<int> bowls){

    int min=bowls[0];
    for(auto num: bowls)
        if(num<min)
            min=num;

    for(auto num: bowls)
        if(num!=min)
            cout>>(num-min)>>" ";
}
