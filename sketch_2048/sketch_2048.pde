// all allocated arrays are initialized to 0 by default
int[][] positions = new int[4][4]; 
int[][] positions1 = new int[4][4]; 



boolean movement; 
boolean c=false; 
Table table;
int i=0;
int r;
int rr;

void setup() {
  size (800, 800);
  background(#C9A767);
  stroke(0);
  for (int x = 0; x < 800; x = x + 200) {
    line(x, 00, x, 800);
    line(0, x, 800, x);
  }

  table = new Table();
  table.addColumn("Name");
  table.addColumn("score");
  TableRow newRow = table.addRow();
  newRow.setString("Name", "Finley");
  newRow.setInt("score", 1000000);
  saveTable(table, "data/highscore.csv");
  
  
// initialize some positions
// You could ask the user whether he wants to play with 2,3,4,5 ?

  // positions[int(random(4))][int(random(4))]=2;
  //positions[int(random(4))][int(random(4))]=2;
 
  positions [3][1]=3;
  positions [3][2]=3;
  positions [0][1]=3;
  positions [1][1]=3;

  for (int x = 0; x < 4; x++) 
    for(int y = 0; y < 4; y++) 
      if (positions[x][y]> 0) 
        drawSquare(x, y);
      
}


//Setup

void draw() {
  background(#C9A767);
  stroke(0);
  for (int x = 0; x < 800; x = x + 200) {
    line(x, 00, x, 800);
    line(0, x, 800, x);
  }
  for (int x = 0; x < 4; x++) {
    for (int y = 0; y < 4; y++) {

      if (positions[x][y]> 0) {
        drawSquare(x, y);
      }
    }
  }
}



void keyPressed () {
  i=0;
 

// check key codes: 37 left, 39 right, 38 up, 40 down
  if (keyCode == 37) {

    // iterate over first column
    for (int y = 0; y < 4; y++) {
      // check always the next cell
      for (int x = 1; x < 4; x++) {
        // find the next non-empty cell 
        int temp=x;
        while( positions[temp][y] == 0 && temp < 3){
          temp++;
        }
        
       
        // case 1: position of x-1 is not empty
        if (positions[x-1][y]!=0  ){
          if( positions[temp][y] == positions[x-1][y]){
            // if the position temp has the same value add it to the current and set temp to 0
            positions[x-1][y] *= 2;
            positions[temp][y]=0;
            }
          else{
            // if the position temp has a different value move it to x and set temp to 0 unless it is x
            positions[x][y]=positions[temp][y];
            if ( temp > x)
              positions[temp][y]=0;
          }
        }
        // case 2: position of x-1 is empty. Then  move temp to x-1
        else{
             positions[x-1][y]=positions[temp][y];
             positions[temp][y]=0;
        }
          
      }
    }
  }
  
        
       /* if (positions[x][y]!=0  ) {

          if (x >0 && positions[x-1][y]==0) {
            i= i+1;
          } else if ( x >0 && positions[x-1][y]!=0 && positions[x-1][y]==positions[x][y]) {
            positions[x-1][y]=positions[x-1][y]*2;
            positions[x][y]=0;
          }
          if ( x >1 && positions[x-2][y]==0) {
            i= i+1;
          } else if ( x >1 && positions[x-2][y]!=0 && positions[x-2][y]==positions[x][y]) {
            positions[x-2][y]=positions[x-2][y]*2;
            positions[x][y]=0;
          }
          if (x >2 && positions[x-3][y]==0) {
            i= i+1;
          } else if ( x >2 && positions[x-3][y]!=0 && positions[x-3][y]==positions[x][y]) {
            positions[x-3][y]=positions[x-3][y]*2;
            positions[x][y]=0;
          }
          positions[x-i][y]=positions[x][y];
          if (i!=0) { 
            positions[x][y]=0;
          }
          if (i != 0) {
            movement=true;
          } else if ( i == 0) {
            movement=false;
          }
          i=0;
        }
      }
    }
  }
*/
  if (keyCode == 39) {
      
    for (int x = 3; x > -1; x--) {
      for (int y = 3; y > -1; y--) {


        if (positions[x][y]!=0  ) {
          if (x <3 && positions[x+1][y]==0) {
            i= i+1;
          } else if ( x <3 && positions[x+1][y]!=0 && positions[x+1][y]==positions[x][y]) {
            positions[x+1][y]=positions[x+1][y]*2;
            positions[x][y]=0;
          }
          if ( x <2 && positions[x+2][y]==0) {
            i= i+1;
          } else if ( x <2 && positions[x+2][y]!=0 && positions[x+2][y]==positions[x][y]) {
            positions[x+2][y]=positions[x+2][y]*2;
            positions[x][y]=0;
          }
          if (x<1 && positions[x+3][y]==0) {
            i= i+1;
          } else if ( x <1 && positions[x+3][y]!=0 && positions[x+3][y]==positions[x][y]) {
            positions[x+3][y]=positions[x+3][y]*2;
            positions[x][y]=0;
          }
          positions[x+i][y]=positions[x][y];
          if (i!=0) { 
            positions[x][y]=0;
          }
           if (i != 0) {
            movement=true;
          } else  {
            movement=false;
          }
          i=0;
        }
      }
    }
  }
  if (keyCode == 40) {
    
    for (int x = 3; x > -1; x--) {
      for (int y = 3; y > -1; y--) {


        if (positions[x][y]!=0  ) {
          if (y <3 && positions[x][y+1]==0) {
            i= i+1;
          } else if ( y <3 && positions[x][y+1]!=0 && positions[x][y+1]==positions[x][y]) {
            positions[x][y+1]=positions[x][y+1]*2;
            positions[x][y]=0;
          }
          if ( y <2 && positions[x][y+2]==0) {
            i= i+1;
          } else if ( y <2 && positions[x][y+2]!=0 && positions[x][y+2]==positions[x][y]) {
            positions[x][y+2]=positions[x][y+2]*2;
            positions[x][y]=0;
          }
          if (y<1 && positions[x][y+3]==0) {
            i= i+1;
          } else if ( y <1 && positions[x][y+3]!=0 && positions[x][y+3]==positions[x][y]) {
            positions[x][y+3]=positions[x][y+3]*2;
            positions[x][y]=0;
          }
          positions[x][y+i]=positions[x][y];
          if (i!=0) { 
            positions[x][y]=0;
          }
           if (i != 0) {
            movement=true;
          } else if ( i == 0) {
            movement=false;
          }
          i=0;
        }
      }
    }
  } 
  if (keyCode == 38) {
   println("38");
    for (int x = 0; x < 4; x++) {
      for (int y = 0; y < 4; y++) {


        if (positions[x][y]!=0  ) {

          if (y >0 && positions[x][y-1]==0) {
            i= i+1;
          } else if ( y >0 && positions[x][y-1]!=0 && positions[x][y-1]==positions[x][y]) {
            positions[x][y-1]=positions[x][y-1]*2;
            positions[x][y]=0;
          }
          if ( y >1 && positions[x][y-2]==0) {
            i= i+1;
          } else if ( y >1 && positions[x][y-2]!=0 && positions[x][y-2]==positions[x][y]) {
            positions[x][y-2]=positions[x][y-2]*2;
            positions[x][y]=0;
          }
          if (y >2 && positions[x][y-3]==0) {
            i= i+1;
          } else if ( y >2 && positions[x][y-3]!=0 && positions[x][y-3]==positions[x][y]) {
            positions[x][y-3]=positions[x][y-3]*2;
            positions[x][y]=0;
          }
          positions[x][y-i]=positions[x][y];
          if (i!=0) { 
            positions[x][y]=0;
          }
          if (i != 0) {
            movement=true;
          } else if ( i == 0) {
            movement=false;
          }
          i=0;
        }
      }
    }
  }
    println(movement);

   if (keyCode == 37||keyCode ==38||keyCode ==39||keyCode ==40 && movement==true) {  
    c = false; 
    while (c==false) {
      r=int(random(4));
      rr=int(random(4));
      if (positions[r][rr]==0)
        positions [r][rr]=3;
      c=true;
    }
  }
}

void drawSquare( int xloc, int yloc  ) {
  fill(100, 10, 10);
  stroke(0);   
  rect(xloc*200, yloc*200, 200, 200);
  fill (0);
  textSize(100);
  text (positions[xloc][yloc], xloc*200+75, yloc*200+125);
}