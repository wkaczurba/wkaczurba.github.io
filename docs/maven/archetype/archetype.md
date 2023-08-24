# java17-quickstart archetype


Source - here, not any separate repo.:
 - [j17archetype.zip](j17archetype.zip)

Building the archetype:
  ```
  mvn install
  ```

Usage:
  ```
  mvn archetype:generate \
    -DarchetypeGroupId=com.kaczurba \
    -DarchetypeArtifactId=j17-quickstart \
  -DarchetypeVersion=1.1-SNAPSHOT \
  -DgroupId=com.project \
  -DartifactId=first-project
  ```

