Flyway for Spring BOOT.
Taken from own private project.

PATCH:
```
Index: pom.xml
IDEA additional info:
Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
<+>UTF-8
===================================================================
diff --git a/pom.xml b/pom.xml
--- a/pom.xml	(revision 186aa6f95e0ce47c91e0c2a6a161ecb3f56abaae)
+++ b/pom.xml	(date 1690995122759)
@@ -43,6 +43,18 @@
 			<version>3.1.4</version>
 		</dependency>
 
+		<dependency>
+			<groupId>org.flywaydb</groupId>
+			<artifactId>flyway-core</artifactId>
+			<version>9.19.4</version> <!-- NOTE: Version 9.20+ fails with spring boot -->
+		</dependency>
+
+		<dependency>
+			<groupId>org.flywaydb</groupId>
+			<artifactId>flyway-mysql</artifactId>
+			<version>9.19.4</version>
+		</dependency>
+
 		<dependency>
 			<groupId>org.springframework.boot</groupId>
 			<artifactId>spring-boot-starter-test</artifactId>
@@ -80,6 +92,19 @@
 				<groupId>org.springframework.boot</groupId>
 				<artifactId>spring-boot-maven-plugin</artifactId>
 			</plugin>
+
+			<plugin>
+				<groupId>org.flywaydb</groupId>
+				<artifactId>flyway-maven-plugin</artifactId>
+				<version>9.19.4</version>
+				<configuration>
+					<url>jdbc:mariadb://127.0.0.1:3307/user1</url>
+					<user>user1</user>
+					<schema>user1</schema>
+					<password>user1_password</password>
+					<locations>db/migration</locations>
+				</configuration>
+			</plugin>
 		</plugins>
 	</build>
 
Index: src/main/resources/application.properties
IDEA additional info:
Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
<+>ISO-8859-1
===================================================================
diff --git a/src/main/resources/application.properties b/src/main/resources/application.properties
--- a/src/main/resources/application.properties	(revision 186aa6f95e0ce47c91e0c2a6a161ecb3f56abaae)
+++ b/src/main/resources/application.properties	(date 1690995044327)
@@ -5,6 +5,11 @@
 server.error.include-message=always
 spring.datasource.username=user1
 spring.datasource.password=user1_password
-spring.datasource.url=jdbc:mariadb://192.168.1.5:3307/user1
+spring.datasource.url=jdbc:mariadb://127.0.0.1:3307/user1
 spring.datasource.driver-class-name=org.mariadb.jdbc.Driver
-spring.jpa.hibernate.ddl-auto=create
\ No newline at end of file
+spring.jpa.hibernate.ddl-auto=create
+
+spring.flyway.baseline-on-migrate=true
+spring.flyway.locations=filesystem:db/migration
+spring.flyway.schemas=user1
+spring.flyway.validate-migration-naming=true
Index: db/migration/V1_0_0__create_feature_flags.sql
IDEA additional info:
Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
<+>UTF-8
===================================================================
diff --git a/db/migration/V1_0_0__create_feature_flags.sql b/db/migration/V1_0_0__create_feature_flags.sql
new file mode 100644
--- /dev/null	(date 1690994458519)
+++ b/db/migration/V1_0_0__create_feature_flags.sql	(date 1690994458519)
@@ -0,0 +1,5 @@
+CREATE TABLE feature_flags (
+   id INTEGER PRIMARY KEY,
+   name VARCHAR(255) NOT NULL,
+   value BOOLEAN
+);

```

Then:
 - simply running Spring Boot will run migrations.
 - `mvn flyway:migrate` migrates
 - `mvn flyway:repair` fixes
 - `mvn flyway:info` gives details about database

