## 1.1 介绍

本项目可以生成一个**静态网页**，显示域名的 SSL 相关信息（证书的颁布时间、到期时间、剩余时间等）。

本项目基于 [@ChenyFan](https://github.com/chenyfan) 的 [CheckSSL](https://github.com/chenyfan/CheckSSL) 、[ssl](https://github.com/chenyfan/ssl) 项目。原作者把生成域名 SSL 信息和生成 SSL 静态监测网站分为两个项目。我做出了一些修改，如下：

- 合并两个仓库，删减多余的文件。
- 可以在本地或者云端（Github Actions）生成域名 SSL 信息。
- 修改域名信息的显示样式。
- 网页样式优化，CSS 文件使用 staticfile 加速。

**demo**

- 原作者 → https://ssl.cyfan.top 
- 我的 → https://sy-ssl.vercel.app/ 

**使用过程出现问题，请提 Issues**。

## 1.2 使用

本项目有两种使用方式。

<font style="color:#ed1c24;font-weight:bolder;">注意</font>：输入的域名必须是可以访问且能显示内容的。否则，读取的信息会出现错误。

### 1.2.1 github pages

1. settings → Developer Settings → Personal access tokens，生成 tokens。权限勾选 repo、workflow、user。
2. Fork 本项目，进入项目的 Settings → Secrets → Actions，点击 New repository secret。NAME 是 `TOKEN`，Value 是上面生成的 tokens。
3. 进入 .github/workflows，打开 SSL-Check.yml。第 39 行，替换为自己的监测域名。多个域名用空格隔开。第 43 行，修改为自己的域名。
4. 保存，Github Actions 开始运行。开启github pages，访问你的 SSL 监测网站。

你还可以部署在 Vercel 上。注意要在 Settings → Git，把分支改成 gh-pages，才可以正常访问。

github 访问时好时坏，github pages 也是如此。所以你可以使用以下方式，部署在服务器上（如果有的话）

### 1.2.2 其他托管方式

1. 克隆项目项目到本地或者下载压缩包。

   ``` bash
   git clone https://github.com/jinghu-moon/ssl-monitor
   ```

2. 进入项目，

   ```bash
   npm install
   ```

   运行 `start.sh`，按照界面提示操作。等待一段时间，可能等会很久，实测，6 个域名需要两分多钟。

3. 脚本运行结束后。文件夹里会出现一个 `public` 文件夹。里面的文件就是一个静态 SSL 监测网站所需的文件。你可以把它放在服务器上或者别的地方。


## 1.3 感谢

- [ChenYFan/CheckSSL: Check your site's SSL status using curl & bash (github.com)](https://github.com/chenyfan/CheckSSL) 
- [SukkaW/CheckSSL: Check your site's SSL status using curl & bash (github.com)](https://github.com/SukkaW/CheckSSL) 
- [ChenYFan/ssl： 🔒 无后端每日检查特定网站的SSL证书状况 (github.com)](https://github.com/chenyfan/ssl) 
- [SukkaLab/ssl (github.com)](https://github.com/SukkaLab/ssl) 

