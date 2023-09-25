int multiplesOf3and5Upto1000_sum(){
        int total = 0; 
        
        for (int i=1; i<1000; ++i){ 
            if(i%3 == 0 || i%5 == 0)
                total += i; 
          
        return total;
}
