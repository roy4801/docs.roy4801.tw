# PyCryptodome

## Installation

```python3 linenums="1"
pip3 install pycryptodome
```

- Run self test

```bash linenums="1"
python3 -m Crypto.SelfTest
```

## Usage

- Generate random bytes

```python3 linenums="1"
from Crypto.Random import get_random_bytes

# 產生 256 位元隨機金鑰（32 位元組 = 256 位元）
key = get_random_bytes(32)
print(key)
```

- Use password to generate key (hash)

```python3 linenums="1"
from Crypto.Protocol.KDF import PBKDF2

# 固定的 salt
salt = b'\xd0\x18\xa7QM\xd6\x9b\xebxu\xe4\xed\xa8\x83\xf6\xa3/\x01\x9c\x9e\x86n\xda;\x10EdD\xf7\x932\xcc'

# 密碼
password = 'my#password'

# 根據密碼與 salt 產生金鑰
key = PBKDF2(password, salt, dkLen=32)
```

### AES CBC

- Encrypt

```python3 linenums="1"
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad

key = b'A'*32 # change
plaintext = b'My secret data.'
cipher = AES.new(key, AES.MODE_CBC)
enc = cipher.encrypt(pad(plaintext, AES.block_size))

# iv: ciphter.iv (16 bytes)
# encrypted: enc
```

- Decrypt

```python3 linenums="1"
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

enc = b'your encrypted data'
iv = b'your iv'
# 以金鑰搭配 CBC 模式與初始向量建立 cipher 物件
cipher = AES.new(key, AES.MODE_CBC, iv=iv)
# 解密後進行 unpadding
plaintext = unpad(cipher.decrypt(enc), AES.block_size)
```

## References

[Python 以 PyCryptodome 實作 AES 對稱式加密方法教學與範例](https://officeguide.cc/python-pycryptodome-aes-symmetric-encryption-tutorial-examples/#comment-1646)

<https://hackmd.io/@Not/Pbkdf2>

<https://stackoverflow.com/questions/30056762/rsa-encryption-and-decryption-in-python>
