class Luna{
  int size;
  float posX, angle, incremento, maxX, pos, velr, anguloRot, vel;
  boolean movimiento;
  Luna(int siz, float posi, float increment,float velocidad, float velocidadr,float max){
    size=siz;
    posX=posi;
    pos=posi;
    movimiento =true;
    incremento=increment;
    vel=velocidad;
    angle=0;
    anguloRot=0;
    velr=velocidadr;
    maxX=max;
  }
  void printLuna(){
    pushMatrix();
    traslacion();
    rotacion(false);
    sphere(size);
    popMatrix();
  }
  
  void rotacion(boolean rot){
    if(rot){
      rotateY(radians(angle));
      if (movimiento){
        angle-=vel;
        if(angle<0){
          angle=360+angle;
        }
      }
    } else{
      rotateY(radians(anguloRot));
      if (movimiento){
        anguloRot-=velr;
        if(anguloRot<0){
          anguloRot=360+anguloRot;
        }
      }
    }
  }
  void movimientoLunas(boolean mov){
    movimiento=mov;
  }
  void traslacion(){
    rotacion(true);
    translate(pos,0,0);
    if(movimiento){
      if (pos+incremento>maxX||pos+incremento < posX ){
        incremento*=(-1);
      }
      pos+=incremento;
    }
  }
}
