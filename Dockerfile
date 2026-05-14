# ═══ ÉTAPE 1 : BUILD ═══════════════════════════════════════════════════
# On utilise une image qui contient Maven ET Java 21 (Eclipse Temurin)
# "AS build" donne un nom à cette étape pour la référencer plus tard
FROM maven:3.9.6-eclipse-temurin-25 AS build

# On définit le dossier de travail dans le conteneur
WORKDIR /app

# On copie TOUT le projet dans /app du conteneur
# Le premier . = votre machine | Le second . = /app dans le conteneur
COPY . .

# On compile le projet et crée le fichier .jar
# -DskipTests = on ne lance pas les tests (plus rapide pour le déploiement)
RUN mvn clean package -DskipTests


# ═══ ÉTAPE 2 : IMAGE FINALE (légère) ═══════════════════════════════════
# On repart d'une image plus légère : juste le JRE (Java Runtime)
# Pas besoin de Maven dans l'image finale → image plus petite → démarrage plus rapide
FROM eclipse-temurin:25-jre

# Dossier de travail dans l'image finale
WORKDIR /app

# On copie UNIQUEMENT le .jar depuis l'étape "build"
# target/*.jar = le fichier JAR créé par Maven
COPY --from=build /app/target/*.jar app.jar

# On expose le port (documentation, pas obligatoire mais bonne pratique)
# Render utilise la variable PORT — application.properties la lit
EXPOSE 8080

# Commande de démarrage — lancée quand le conteneur démarre
# ENTRYPOINT = commande principale non surchargeable
ENTRYPOINT ["java", "-jar", "app.jar"]