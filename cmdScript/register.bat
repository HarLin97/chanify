@echo off

@REM ����Ա��ʽ��
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

@REM ���뵱ǰĿ¼
cd /d "%~dp0"

@REM �����ļ���
mkdir C:\"Program Files"\chanify

@REM ���Ƴ����ļ���
xcopy /QY chanify.exe C:\"Program Files"\chanify\

@REM ����ϵͳ��������
setx path "%path%;C:\Program Files\chanify" /m

@REM ɾ���Զ���ע�����
reg delete HKEY_CLASSES_ROOT\*\shell\ChanifyFile\command /ve /f
reg delete HKEY_CLASSES_ROOT\*\shell\ChanifyAudio\command /ve /f
reg delete HKEY_CLASSES_ROOT\*\shell\ChanifyImage\command /ve /f

@REM ע���ļ��Ҽ��Զ���ע�����
reg delete HKEY_CLASSES_ROOT\*\shell\ChanifyFile /ve /f
reg delete HKEY_CLASSES_ROOT\*\shell\ChanifyAudio /ve /f
reg delete HKEY_CLASSES_ROOT\*\shell\ChanifyImage /ve /f

@REM ע���ļ��Ҽ��Զ���ע����������������Ϊ���ַ�ʽ���ͣ�����ʵ��ʹ��������ж���
reg add HKEY_CLASSES_ROOT\*\shell\ChanifyFile\command /ve /t REG_SZ /d "cmd.exe /c chanify send --endpoint=https://<address>:<port> --token=<token> --file="%%L""
reg add HKEY_CLASSES_ROOT\*\shell\ChanifyAudio\command /ve /t REG_SZ /d "cmd.exe /c chanify send --endpoint=https://<address>:<port> --token=<token> --audio="%%L""
reg add HKEY_CLASSES_ROOT\*\shell\ChanifyImage\command /ve /t REG_SZ /d "cmd.exe /c chanify send --endpoint=https://<address>:<port> --token=<token> --image="%%L""

@REM ע���ļ��Ҽ�����
reg add HKEY_CLASSES_ROOT\*\shell\ChanifyFile /ve /t REG_SZ /d ��Ϊ�ļ�����
reg add HKEY_CLASSES_ROOT\*\shell\ChanifyAudio /ve /t REG_SZ /d ��Ϊ��Ƶ����
reg add HKEY_CLASSES_ROOT\*\shell\ChanifyImage /ve /t REG_SZ /d ��ΪͼƬ����
