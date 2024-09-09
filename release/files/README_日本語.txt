ROMを適切なOSプログラムへドラッグして下さい。
outputフォルダにリミックスのROMが生成されます。

ネトスマでリミックスをプレイする場合は、project64フォルダーの中に project64.rdb を置いて下さい。
また、既に project64.rdb が project64フォルダ内にある場合は、以下のコードを既存の project64.rdb にペーストして下さい。

[05BA5CCD-ABB97C1E-C:45]
Good Name=SmashRemix{VERSION}
Internal Name=SmashRemix
Status=Compatible
Counter Factor=1
Culling=1
SMM-Cache=0
SMM-FUNC=0
SMM-TLB=0
Use TLB=No
RDRAM Size=8
ViRefresh=2200

ROMの生成に失敗する場合は、プログラムの修正指示に従って下さい。

もし修正指示に従っても解決できない場合、次の手順に従いDelta UI を使用して下さい。

Step 1:
変更が加えられていないスマブラのROM（US版）があることを確認します。ファイル名は「.z64」です。「.n64」や「.v64」では機能しません！それらのファイルはTool64を用いて簡単に「.z64」に変換することができます。変換後、Tool64で新しく変換されたファイルを開き、変換が正常に終了していることを確認して下さい。

Step 2:
Delta UI を起動します。ソースファイルを選択するボックス（Source File box）で「Open」をクリックし、ROMファイルを選択します。（「.z64」であることを確認する）

Step 3:
パッチファイルを選択するボックス（Patch box）で「Open」をクリックし、「smashremix.1.5.0.xdelta」の最新バージョンを選択します。（該当ファイルは patchesフォルダー内にあります）

Step 4:
出力ファイルを選択するボックス（Output File box）で「Open」をクリックし、拡張子が「.z64」のファイルを選択します。

Step 5:
パッチをクリックすると、スマブラリミックスがプレイできます。

iOSユーザーへ:
こちらのWebサイトでWebベースのパッチ適用ツールを利用いただけます。
https://hack64.net/tools/patcher.php

MUPEN64PLUS USERS:

If you want the ROM to properly appear in your Mupen64Plus frontend (i.e. m64py)Good ROM known database, copy this text entry and paste it into your 
current mupen64plus.ini:

[18EC45DD6C723AAB1F2D6577C68164F2]
GoodName=SmashRemix{VERSION}
CRC=05BAD793-42637A0F
Status=3
SaveType=SRAM
Players=4
Rumble=Yes
CountPerOp=1

In m64py for Windows, this file is usually inside the folder "C:\Program Files (x86)\M64Py"
If you use other frontend, you can try searching the mupen64plus.ini file in the same folder where it is the frontend executable.
In Linux, this file is usually inside the user folder "/home/your-username/.config/mupen64plus", though this may change with the distribution.
This step is not needed as mupen64plus already runs Smash Remix properly, only that it will add the ROM to the Good ROM compatible database, 
so you do not have to manually search for it each time.

The "CountPerOp" line is the Mupen64Plus equivalent to Project64's "Counter Factor" option.

Also, don't add the "ViRefresh=2200" line to mupen64plus.ini, because mupen64plus uses a different method that automatically calculates the VI refresh 
rate for the game its running to guarantee stable framerate while keeping optimal performance, so no overclocking is needed.