import controlP5.*;


final int Displaywidth=1500;
final int Displayheight=1000;

int nbH=12;
int first_ele=100;
int ecare =first_ele+40;

ControlP5 cp5;
DropdownList groupDropdown;
DropdownList salleDropdown;
DropdownList statDropdown;
String selectedGroup = "";
Bouton prochain=new Bouton();
Bouton precedent=new Bouton();

void initDisplay() {

  prochain.init(30, 30, "flèche.png");
  precedent.init(30, 30, "flèche2.png");
  prochain.actif=true;
  precedent.actif=true;

  cp5 = new ControlP5(this);

  groupDropdown = cp5.addDropdownList("Select Group") //liste Deroulante des groupes
    .setPosition(width/10, height/16-10)
    .setSize(width/5, width/5)
    .setBarHeight(30)
    .setItemHeight(25)
    .setColorBackground(color(100, 100, 255))
    .setColorActive(color(200, 100, 100))
    .setColorForeground(color(150, 150, 255));

  salleDropdown = cp5.addDropdownList("Select salle") //liste Deroulante des salles
    .setPosition(width/10+width/5+20, height/16-10)
    .setSize(width/5, width/5)
    .setBarHeight(30)
    .setItemHeight(25)
    .setColorBackground(color(100, 100, 255))
    .setColorActive(color(200, 100, 100))
    .setColorForeground(color(150, 150, 255));
    
  statDropdown = cp5.addDropdownList("Select Stats") //liste Deroulante des salles
    .setPosition(width/10+width/5*2+40, height/16-10)
    .setSize(width/5, width/5)
    .setBarHeight(30)
    .setItemHeight(25)
    .setColorBackground(color(100, 100, 255))
    .setColorActive(color(200, 100, 100))
    .setColorForeground(color(150, 150, 255));
    
  groupDropdown.close();
  salleDropdown.close();
  statDropdown.close();
  addGroups(new String[]{"Group 1", "Group 2", "Group 3", "Group 4", "Group 5"});
  addSalles(new String[]{"0.04", "0.05", "0.06", "0.07", "0.08", "0.09"});
  addStats(new String[]{"graph,%"});
}



void Edt() {

  fill(255);
  stroke(0);
  rect(first_ele, height/8+10, (width-ecare)/5+first_ele-10, height-20);
  rect((width-ecare)/5+first_ele, height/8+10, (width-ecare)/5*2+first_ele-10, height-20);
  rect((width-ecare)/5*2+first_ele, height/8+10, (width-ecare)/5*3+first_ele-10, height-20);
  rect((width-ecare)/5*3+first_ele, height/8+10, (width-ecare)/5*4+first_ele-10, height-20);
  rect((width-ecare)/5*4+first_ele, height/8+10, (width-ecare)+first_ele-10, height-20);
  Boutons();
  textAlign(CENTER, CENTER);

  fill(0, 0, 0);
  text("Lundi", ((width-ecare)/5)/2+first_ele, (height/8+30));
  text("Mardi", (width-ecare)/5+((width-ecare)/5)/2+first_ele, (height/8+30));
  text("Mercredi", (width-ecare)/5*2+((width-ecare)/5)/2+first_ele, (height/8+30));
  text("Jeudi", (width-ecare)/5*3+((width-ecare)/5)/2+first_ele, (height/8+30));
  text("Vendredi", (width-ecare)/5*4+((width-ecare)/5)/2+first_ele, (height/8+30));


  heure();
}

void Boutons() {
  prochain.x=width-40;
  prochain.y=height/2;
  prochain.dessin();

  precedent.x=12;
  precedent.y=height/2;
  precedent.dessin();
}

void addGroups(String[] groups) {
  for (int i = 0; i < groups.length; i++) {
    groupDropdown.addItem(groups[i], i);
  }
}
void addSalles(String[] salles) {
  for (int i = 0; i < salles.length; i++) {
    salleDropdown.addItem(salles[i], i);
  }
}

void addStats(String[] Stats) {
  for (int i = 0; i < Stats.length; i++) {
    statDropdown.addItem(Stats[i], i);
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(groupDropdown)) {
    selectedGroup = groupDropdown.getItem((int) theEvent.getValue()).get("name").toString();
    println("Selected Group: " + selectedGroup);
    
  }
}

void heure() {
  fill(0, 0, 0);
  for (int i=0; i<nbH; i++) {
    if (i!=nbH-1) {
      text(8+i+":00", 70, ((height-20)-(height/8+50))/(nbH-1)*i+(height/8+50));
      for (int y=1; y<51; y++) {
        if (y%2==0)line((width-ecare)/50*(y-1)+first_ele-15, ((height-20)-(height/8+50))/(nbH-1)*i+(height/8+50), (width-ecare)/50*y+first_ele-15, ((height-20)-(height/8+50))/(nbH-1)*i+(height/8+50));
        
      }
    } else text(">"+(8+i)+":00", 70, ((height-20)-(height/8+50))/(nbH-1)*i+(height/8+50));
  }
}

int Hm(Event event){                  
  return parseInt(event.timeStart.substring(9,12));
}

int AMJ(Event event){                  
  return parseInt(event.timeStart.substring(0,7));
}




void draw() {
  background(240);
  fill(0, 255, 0);
  rect(0, 0, width, height/8);
  textSize(18);
  Edt();
}

