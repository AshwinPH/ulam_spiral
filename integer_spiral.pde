int sideLen = 1;
int sideCount = 0;
int sideIdx = 1;
int x = 250;
int y = 250;
char dir = 'n';
int spacing = 4;
float defaultSize = 4;
float size = defaultSize;
IntList primes;
String mode;
void setup(){
 size(900,900);
 mode = "ULAM";
 background(0);
 x = width/2;
 y = height/2;
 //boolean isPrime = true;
 
 rectMode(CENTER);
 
 for(int i=0; i<width*height/(spacing*spacing);i++){
   //size=int(5*i/(width*height/spacing/spacing));
   if(sideIdx>=sideLen){
     sideCount++;
     sideIdx=0;
     if(dir=='n'){
       dir='e';
     }else if(dir=='e'){
       dir='s';
     }else if(dir=='s'){
       dir='w';
     }else{
       dir='n';
     }
   }
   sideIdx++;
   if(sideCount==3){
     sideLen++;
     sideCount=0;
   
   }
   if(mode == "ULAM"){
     if(isPrime(i)){
       noStroke();
       fill(255);
       ellipse(x,y,size,size);
     }
   }else if(mode == "MULTIPLES"){
     if(multiples(i,9,25,18)){
       noStroke();
       fill(255);
       ellipse(x,y,size,size);
     }
   }else if(mode == "RANDOM"){
      if(rand()){
        noStroke();
       fill(255);
       ellipse(x,y,size,size);
      }
   }
       
   
   if(dir=='n'){
     y-=spacing;
   }else if(dir=='e'){
     x+=spacing;
   }else if(dir=='s'){
     y+=spacing;
   }else{
     x-=spacing;
   }
   //println("len-" + sideLen + " : cnt-" + sideCount +" : idx-" + sideIdx + " : dir-" + dir);
 }
  
}

void loop(){
  
  
}

boolean isPrime(int n){
  for(int i=2; i<n-1;i++){
     if(n%i==0){
      return false; 
     }
  }
  return true;
}

boolean multiples(int n, int m1, int m2, int m3){
   if(n%m1==0||n%m2==0||n%m3==0){
     return true;
   }
   return false;
}
boolean rand(){
   if(int(random(1,10)) == 5){
      return true; 
     
   }
   return false;
}
