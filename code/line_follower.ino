/*
Robot suiveur de ligne

auteur : ACoLab - Atelier collaboratif
*/

// On définit sur quelles broches sont les capteurs infrarouge
#define broche_IR_gauche 2
#define broche_IR_droit 3

// On définit les broches pour le moteur gauche
#define ENA 10
#define IN1 9
#define IN2 8

// On définit les broches pour le moteur droit
#define IN3 7
#define IN4 6
#define ENB 5

// Vitesse de rotation des moteurs
int vitesse = 80;

// Initialisation
void setup() {
  // Initialisation de la communications série à 9600 bits par seconde:
  Serial.begin(9600);
  
  // Déclaration des broches des capteurs en entrées
  pinMode(broche_IR_gauche, INPUT);
  pinMode(broche_IR_droit, INPUT);

  // Déclaration des broches des moteurs en sortie
  pinMode(ENA, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);

  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  pinMode(ENB, OUTPUT);

  Serial.println("Je suis prêt !");
}

void active_moteur_gauche(int vitesse_gauche){
  if(vitesse_gauche > 0){
    digitalWrite(IN1, LOW);
    digitalWrite(IN2, HIGH);
  }
  else{
    digitalWrite(IN2, LOW);
    digitalWrite(IN1, HIGH);
  }
  analogWrite(ENA, vitesse_gauche);
  Serial.print("Moteur gauche à vitesse ");
  Serial.println(vitesse_gauche);
}

void stoppe_moteur_gauche(){
  analogWrite(ENA, 0);

  Serial.println("Moteur gauche arrété");
}

void active_moteur_droit(int vitesse_droite){
  if(vitesse_droite > 0){
    digitalWrite(IN3, LOW);
    digitalWrite(IN4, HIGH);
  }
  else{
    digitalWrite(IN4, LOW);
    digitalWrite(IN3, HIGH);
  }
  analogWrite(ENB, vitesse_droite);
  Serial.print("Moteur droit à vitesse ");
  Serial.println(vitesse_droite);
}

void stoppe_moteur_droit(){
  analogWrite(ENB, 0);

  Serial.println("Moteur droit arrété");
}

// Fonction principale (boucle)
void loop() {
  // Lecture des capteurs infrarouges
  int blanc_a_gauche = digitalRead(broche_IR_gauche);
  int blanc_a_droite = digitalRead(broche_IR_droite);

  if(blanc_a_gauche && !blanc_a_droite){
    Serial.println("blanc seulement à gauche");
    
  }
  else if (!blanc_a_gauche && blanc_a_droite){
    Serial.println("blanc seulement à droite");
    
  }
  else if (blanc_a_gauche && blanc_a_droite){
    Serial.println("blanc des deux côtés");
    stoppe_moteur_gauche();
    stoppe_moteur_droit();
  }
  else if (!blanc_a_gauche && !nblanc_a_droite){
    Serial.println("noir des deux côtés");
    stoppe_moteur_gauche();
    stoppe_moteur_droit();    
  }
  
  delay(1);        // delay in between reads for stability
}
