# 03-MyThirdJava

* AbstractCar 抽象類別

        抽象可以想像成一種概念，並不存在於世界上

        abstract 是一個Java的關鍵字，是一個修飾子，可以用來修飾的有： 1. 類別 2. 方法

        把Animal視為一種『概念』，他是抽象的，不存在於世界上的。 而Dog、Bird、Fish都具備這個概念的特質，所以繼承Animal。

* Interface 介面
        
        介面，描述不同類別的共通行為
        創建共通行為 方法來實作class

* object 物件

        Java 中的所有物件即是Object
        物件中定義的方法只要不是final 都可以被複寫
        @Override toString()

* tryncatch 例外處理

        擷取不正常發生的狀況 避免程式終止
        終止不正確的結果
        非程式撰寫導致的異常狀況
        將正常處理程序與錯誤處理程序分開

* array 陣列

        collection 介面
        動態陣列 
        add() / clear() / isEmpty() / size() / remove()

        List 串列
        有特定順序 有index 可以重複

        Set 集
        無特定順序 無index 不可重複

        Map 集合介面 映射表
        無繼承collection
        無特定順序 有index <key,value>
        key 不可重複 value可重複

* Lambda
        
        GetSimple 
        利用 Runnable Interface 實作
        Runnable runnable = () ->System.out.println("run");

        LambdaArray
        list.forEach(i -> System.out.println(i));
        List<>泛型

        LambdaStream
        將Array 轉成 stream 利用.map 轉至內容在使用collect 轉回list

* Homework
        
        HW1 猜大小遊戲利用try and catch 避免輸入是String 時發生錯誤

        HW2 將名子轉大寫並加入hello 字串分行顯示
        利用lamda 將 list 轉到 set 避免重複