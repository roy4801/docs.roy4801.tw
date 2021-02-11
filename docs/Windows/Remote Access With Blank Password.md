# Remote Access With Blank Password

!!!danger
	允許空白密碼登入非常危險，請知道你在做啥

* `gpedit.msc` > Computer Configuration\Windows Settings\Security Settings\Local Policies\Security Options\Accounts
	* 關閉即可

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]
"LimitBlankPasswordUse"=dword:00000000
```

## Ref

<https://superuser.com/questions/106917/remote-desktop-without-a-password>
<https://harshasnmp.wordpress.com/2018/03/21/windows-allow-remote-desktop-access-with-blank-passwords/>
