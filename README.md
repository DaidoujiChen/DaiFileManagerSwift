# DaiFileManagerSwift
存取裝置內的檔案資料是一件普遍, 而且常用的事情, 但是這些功能的調用上, 繁瑣又重複的, 所以我們應該建立一個工具, 可以簡單的來表示我們想做的事情, 以及處理這些每次會用到, 但是每次都會忘記怎麼用的事情上.

Daidouji

daidoujichen@gmail.com

## 安裝
只有一個檔案, `DaiFileManager.swift`, 請將這個檔案複製至你當前的專案後, 即可放心地使用

## 用法
### 路徑
我做了兩個開始用的進入點, `document` / `resource`, 分別代表這次的行為從使用者裝置內的 `Document` 資料夾, 或是 app bundle 的 `Resource` 資料夾開始, 像是

`````swift
// document folder
DaiFileManager.document

// resource folder
DaiFileManager.resource
`````

在路徑的結尾, 只要加上 `.path` 即可將當前的路徑, 轉換為 `String` 的格式輸出

`````swift
print(DaiFileManager.document.path)
// Documents/
`````

資料夾的切換, 可以像是這樣

`````swift
print(DaiFileManager.document["/HelloWorld/"].path)
// Documents/HelloWorld/
`````

而 `HelloWorld` 這層路徑, 由 `DaiFileManager` 自行產生, 不需要煩惱還要手動建置資料夾的問題.

### 檔案 (寫入 / 讀取 / 複製 / 移動 / 刪除)
常見的案例中, 我們會有對檔案操作的需求, 我們一項一項的來測試使用, 首先我們建立一個空的檔案名為 `EmptyFile` 放在 `document` 資料夾下

`````swift
DaiFileManager.document["/EmptyFile"].write(NSData())
`````
![image](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7+2015-11-11+%E4%B8%8B%E5%8D%881.54.20.png)

然後把他複製一份叫做 `EmptyFile - Copy`

`````swift
DaiFileManager.document["/EmptyFile"].copy(DaiFileManager.document["/EmptyFile - Copy"])
`````
![image](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7+2015-11-11+%E4%B8%8B%E5%8D%882.01.40.png)

也可以把他移動到指定資料夾, 比如說 `Hello`

`````swift
DaiFileManager.document["/EmptyFile"].move(DaiFileManager.document["/Hello/EmptyFile - Copy"])
`````
![image](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7+2015-11-11+%E4%B8%8B%E5%8D%882.57.15.png)

如同剛剛前面說過的, 無須煩惱 `Hello` 資料夾是否存在, 會由 `DaiFileManager` 代為完成, 最後, 我們把 `Hello/Empty - Copy` 檔案刪除

`````swift
DaiFileManager.document["/Hello/EmptyFile - Copy"].delete()
`````
![image](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7+2015-11-11+%E4%B8%8B%E5%8D%883.00.46.png)

或是刪除 Hello 資料夾

`````swift
DaiFileManager.document["/Hello"].delete()
`````
![image](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/%E8%9E%A2%E5%B9%95%E5%BF%AB%E7%85%A7+2015-11-11+%E4%B8%8B%E5%8D%883.02.47.png)

最後, 讀取檔案 `EmptyFile - Copy`

`````swift
let readData = DaiFileManager.document["/EmptyFile - Copy"].read()
`````

### 列表
我們也可以很方便的列出, 某個資料夾下的檔案群, 或是資料夾群

`````swift
// 列出 document 資料夾下的所有檔案
DaiFileManager.document.files.all()

// 列出 document 資料夾下的所有資料夾
DaiFileManager.document.folders.all()
`````

更可以進一步的, 過濾出所需要的關鍵字詞

`````swift
DaiFileManager.document.files.filter("Empty")
`````

### 其他
有些時候, 我們只是想判斷當前路徑下的檔案存不存在, 可以用 `DaiFileManager` 下的 method 來做

`````swift
DaiFileManager.isExistIn(DaiFileManager.document["/EmptyFile"].path)
`````



