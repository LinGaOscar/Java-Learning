# Java-Learning

個人 Java 學習練習紀錄，依課程進度累積的練習檔案集合，**不是單一應用程式**。

## 涵蓋內容

- **01-Hello**：Hello World，Java 編譯與執行的第一步。
- **02-MyFirstJava**：基本資料型態、變數（宣告/位置/運算子）、一維陣列、跳脫字元、流程控制（if / switch / for / while / break & continue）、課後作業。
- **03-MySecondJava**：物件導向基礎 —— 封裝（Encapsulation）、繼承（Inheritance）、多型（Polymorphism）、方法覆載（Overloading）。
- **04-MyThirdJava**：抽象類別（Abstract）、介面（Interface）、Object 與方法覆寫、例外處理（try/catch）、集合（List / Set / Map）、Lambda 與 Stream。

各資料夾對應的 `doc/README-0N.md` 有該主題的簡短中文筆記。`doc/` 底下另有課程投影片（`.pptx`）與課綱（`.docx`），為上課教材，非程式碼。

## 如何組織

- 每個 `0N-*` 資料夾是一個獨立的 Eclipse Java 專案（含 `.classpath` / `.project`），彼此沒有相依關係，可以只挑其中一個資料夾練習。
- 原始碼在各專案的 `src/com/oscar/<主題>/` 底下，依主題分包，每個 `.java` 檔案是獨立可執行的練習範例，彼此互不呼叫。
- `01-Hello` 是例外：沒有 package、沒有 Eclipse 專案結構，是最初的單檔範例。

## 如何執行範例

不使用 Maven/Gradle，直接用 JDK 內建工具編譯執行：

```bash
# 以 02-MyFirstJava 的 HelloWorld 為例
cd 02-MyFirstJava/src
javac com/oscar/hello/HelloWorld.java
java com.oscar.hello.HelloWorld
```

```bash
# 01-Hello 沒有 package，直接編譯執行
cd 01-Hello
javac HelloWorld.java
java HelloWorld
```

其他練習檔案（如 `LogicFor.java`、`Overloading.java`、`AbstractCar.java` 等）依同樣方式，換成對應的 package 路徑與類別名稱即可。細節見 [`dev.md`](./dev.md)。

## 開發環境

各專案 `.settings/org.eclipse.jdt.core.prefs` 設定 compiler compliance 為 JDK 11，建議本機安裝 JDK 11 或以上版本。
