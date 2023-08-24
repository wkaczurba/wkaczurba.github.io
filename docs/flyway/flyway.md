Flyway for generic Java.
Taken from own private project.


```
---
Index: pom.xml
IDEA additional info:
Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
<+>UTF-8
===================================================================
diff --git a/pom.xml b/pom.xml
--- a/pom.xml	(revision 3d0f9f4a109b16664ff07904adb0934802721543)
+++ b/pom.xml	(date 1690984451505)
@@ -72,6 +72,12 @@
 			<artifactId>springdoc-openapi-ui</artifactId>
 			<version>1.7.0</version>
 		</dependency>
+
+		<dependency>
+			<groupId>org.flywaydb</groupId>
+			<artifactId>flyway-mysql</artifactId>
+			<version>9.21.1</version>
+		</dependency>
 	</dependencies>
 
 	<build>
@@ -79,8 +85,24 @@
 			<plugin>
 				<groupId>org.springframework.boot</groupId>
 				<artifactId>spring-boot-maven-plugin</artifactId>
+			</plugin>
+			<plugin>
+				<groupId>org.flywaydb</groupId>
+				<artifactId>flyway-maven-plugin</artifactId>
+				<version>9.21.1</version>
+				<configuration>
+					<user>user1</user>
+					<password>user1_pass</password>
+					<schemas>
+						<schema>user1</schema>
+					</schemas>
+					<url>jdbc:mariadb://127.0.0.1:3307/user1</url>
+					<locations>filesystem:db/migration</locations>
+					<baselineOnMigrate>true</baselineOnMigrate>
+				</configuration>
 			</plugin>
 		</plugins>
+
 	</build>
 
 </project>
Index: db/migration/V0_0_0_first_migration.sql
IDEA additional info:
Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
<+>UTF-8
===================================================================
diff --git a/db/migration/V0_0_0_first_migration.sql b/db/migration/V0_0_0_first_migration.sql
new file mode 100644
--- /dev/null	(date 1690983949388)
+++ b/db/migration/V0_0_0_first_migration.sql	(date 1690983949388)
@@ -0,0 +1,5 @@
+CREATE TABLE IF NOT EXISTS `features` (
+    `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
+    `param` varchar(20)
+    `value` varchar(50)
+)
Index: flyway.conf
IDEA additional info:
Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
<+>UTF-8
===================================================================
diff --git a/flyway.conf b/flyway.conf
new file mode 100644
--- /dev/null	(date 1690983689977)
+++ b/flyway.conf	(date 1690983689977)
@@ -0,0 +1,3 @@
+flyway.user=user1
+flyway.password=user1_pass
+flyway.schemas=user1
```
