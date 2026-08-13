# dev.md

## 本機環境

- JDK 11（依各專案 `.classpath` / `.settings/org.eclipse.jdt.core.prefs` 的 compiler compliance 設定）。用 `java -version` 確認版本 ≥ 11 即可。
- 無 Maven/Gradle，也不需要額外套件，純 JDK 即可編譯執行。
- 專案是用 Eclipse 建立的（含 `.classpath` / `.project`），也可以直接用 Eclipse 或 IntelliJ IDEA 把對應資料夾當作既有 Java 專案 import 開啟。

## 執行單一範例

在對應資料夾的 `src` 底下，依 package 路徑編譯執行：

```bash
cd 02-MyFirstJava/src
javac com/oscar/logic/LogicFor.java
java com.oscar.logic.LogicFor
```

同一 package 底下有多個檔案互相參考時（例如 `04-MyThirdJava` 的 `abstra`），一次編譯整個 package 較省事：

```bash
cd 04-MyThirdJava/src
javac com/oscar/abstra/*.java
java com.oscar.abstra.GoCar
```

`01-Hello` 沒有 package，直接在該資料夾內編譯執行：

```bash
cd 01-Hello
javac HelloWorld.java
java HelloWorld
```

## 結構備註

- 每個 `0N-*` 資料夾是獨立專案，互不相依，只開其中一個資料夾練習也沒問題。
- 沒有測試（無 JUnit），練習正確性以 `System.out.println` 輸出人工檢查為主。
- `.classpath` / `.project` / `.settings/` 是 Eclipse 專案設定檔，非必要但保留可直接用 Eclipse 開啟。
- 已編譯的 `.class` 檔案有些留在 repo 內（如 `01-Hello/HelloWorld.class`），重新編譯會覆蓋，不影響原始碼。
