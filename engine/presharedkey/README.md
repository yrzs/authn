# Pre-shared Key (PSK)

## 什么是PSK？

首先，PSK和密码不是一回事。

预共享密钥(PSK) 是当设备通过 Wi-Fi 接入点 (AP) 加入网络时生成的超长系列看似随机的字母和数字。当用户使用 SSID（网络名称）和密码（有时称为密码）登录网络时，该过程就开始了。

然后使用 SSID 和密码（8-63 个字符）创建 PSK，然后将其与其他信息结合使用以创建更复杂的加密密钥，以保护通过网络发送的数据。

以下是 SSID、密码和 PSK 的示例：

- SSID：John’s Home Network
- 密码/密码： secretpassword123
- PSK: c9a68e83bfd123d144ec5256bc45682accfb8e8f0561f39f44dd388cba9e86f2

在所谓的“四次握手”期间，客户端设备（智能手机、平板电脑、笔记本电脑）和接入点之间来回发送四条消息。目标是生成所谓的“成对传输密钥”或 PTK，一旦网络连接建立，最终用于加密客户端设备和接入点之间的所有流量。

为了在四次握手期间生成 PTK，从设备和接入点收集或生成以下五条信息，并在消息中来回发送：

- PMK - 成对主密钥（PSK 身份验证后生成的第一个密钥）
- Anonce - 由接入点生成的随机数（“A”表示authenticator，这就是接入点，“nonce”表示一次性使用）
- Snonce - 由客户端设备生成的随机数（“S”表示请求者，这就是设备，“nonce”表示“使用一次并丢弃”）
- MAC AA - “认证器”或 Wi-Fi 接入点的 MAC 地址
- MAC SA - “请求者”或客户端设备的 MAC 地址

然后使用下面的函数生成 PTK。在此函数中，术语“PRF”的意思是“伪随机函数”，它只是应用于五条信息以生成更安全的顶级 PTK 的函数：

PTK = PRF (PMK + Anonce + SNonce + Mac (AA) + Mac (SA))