# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Project 目的

個人 Java 學習練習集合，**不是單一應用程式**。依課程進度分資料夾（`01-Hello` ~ `04-MyThirdJava`），每個資料夾對應一個獨立的 Eclipse Java 專案，練習範圍從 Java 基礎語法到物件導向、例外處理、集合、Lambda。`doc/` 內有對應課程的簡短筆記與投影片，非程式碼。

## Commands

沒有建置工具（無 Maven/Gradle），直接用 JDK 內建的 javac/java 編譯執行，例如：

```bash
# 02-MyFirstJava ~ 04-MyThirdJava：有 package，需切到 src 底下依路徑編譯
cd 02-MyFirstJava/src
javac com/oscar/hello/HelloWorld.java
java com.oscar.hello.HelloWorld
```

```bash
# 01-Hello：沒有 package，直接在資料夾內編譯執行
cd 01-Hello
javac HelloWorld.java
java HelloWorld
```

## Architecture

- `01-Hello/`：最初的 Hello World，無 package、無 Eclipse 專案結構。
- `02-MyFirstJava/` ~ `04-MyThirdJava/`：各自獨立的 Eclipse Java 專案（含 `.classpath` / `.project`，compiler compliance JDK 11），彼此無相依關係。原始碼在 `src/com/oscar/<主題>/`，依主題分包（如 `primitive`、`logic`、`variable`、`encapsulation`、`inheritance`、`polymorphism`、`abstra`、`inter`、`object`、`tryncatch`、`array`、`lambda`、`homework`），每個 .java 檔案是獨立可執行、彼此不互相呼叫的練習範例。
- `doc/README-0N.md`：對應每個資料夾主題的簡短中文筆記。
- `doc/*.pptx`、`doc/*.docx`：課程投影片與課綱，非程式碼，勿當作程式邏輯來源。
- `repository.zip.001` / `.002`：歷史遺留的分卷壓縮備份檔，與目前練習內容無關。

沒有測試（無 JUnit）、沒有跨模組相依。修改或新增練習時，維持「一個檔案一個獨立範例」的既有慣例即可，不需要引入建置工具或跨檔案抽象。
