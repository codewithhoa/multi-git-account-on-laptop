<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/codewithhoa/multi-git-account-on-laptop">
    <img src="images/golang.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Set up multiple account git on the same laptop</h3>

  <p align="center">
    <br />
    <a href="https://github.com/codewithhoa/multi-git-account-on-laptop"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/codewithhoa/multi-git-account-on-laptop">View Demo</a>
    ·
    <a href="https://github.com/codewithhoa/multi-git-account-on-laptop/issues">Report Bug</a>
    ·
    <a href="https://github.com/codewithhoa/multi-git-account-on-laptop/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
    <li><a href="#references">References</a></li>
  </ol>
</details>

## About The Project

[![Product Name Screen Shot][product-screenshot]](https://github.com/codewithhoa/multi-git-account-on-laptop)

# Làm thế nào để cấu hình nhiều tài khoản github trong cùng một laptop

> Nếu bạn đang có một tài khoản github cá nhân, mà khi tham gia vào công ty thì công ty lại cung cấp cho bạn một tài khoản github khác.

> Hoặc nếu bạn muốn tạo một github clone(như fb clone) để dành cho mục đích thử nghiệm cá nhân, hoặc thử nghiệm khi làm việc với nhiều người trong dự án ntn thì đây là cách dành cho bạn.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

Đây là những công cụ mà mình dùng:

- [![iTerm2][iterm2.com]][iterm2-url] Terminal mình dùng iTerm2

## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

Ở đây mình tạo tài khoản và lấy tên như sau: https://github.com/codewithhoa với email: millomilk2022@gmail.com

### Installation

1. Tạo ra một SSH key mới

   1.1 Mở terminal lên(ở đây mình dùng iTerm2 - như một terminal cá nhân)

   1.2 Bước này quan trọng lắm nha

   Đầu tiên bạn phải kiểm tra xem trong thư mục ssh hiện tại xem có tồn tại ssh key đã gen hay chưa:

   ```sh
   tree -L 2 ~/.ssh

   /Users/haihoa/.ssh
   ├── config
   ├── id_rsa
   ├── id_rsa.pub
   ├── known_hosts
   └── known_hosts.old
   ```

   ở đây mình có gen ssh key cho mail vukieuhaihoa@gmail.com ra 2 file: id_rsa, id_rsa.pub rồi, bây giờ gen ssh key cho mail millomilk2022@gmail.com mình phải dùng một tên mới: id_rsa_millo ví dụ vậy

   1.3 Tạo ssh key mới

   ```sh
    ssh-keygen -t rsa -b 4096 -C "millomilk2022@gmail.com"
   ```

   ở đây nó sẽ tại ra một prompted để nhập tên file key

   ```sh
   > Enter a file in which to save the key (/Users/YOU/.ssh/id_ALGORITHM): id_rsa_millo

   ```

   tiếp theo nó sẽ hiện ra một cái prompted mới để nhập passphrase (kiểu như mật khẩu cấp 2)

   ```sh
   > Enter passphrase (empty for no passphrase): [Type a passphrase]
   > Enter same passphrase again: [Type passphrase again]
   ```

   kiểm tra lại xem trong thư mục .ssh có chưa nè:

   ```sh
   tree -L 2 ~/.ssh

   /Users/haihoa/.ssh
   ├── config
   ├── id_rsa
   ├── id_rsa.pub
   ├── id_rsa_millo
   ├── id_rsa_millo.pub
   ├── known_hosts
   └── known_hosts.old
   ```

   1.4 Adding your SSH key to the ssh-agent

   Start the ssh-agent in the background.

   ```sh
   $ eval "$(ssh-agent -s)"
   > Agent pid 59566
   ```

   kiểm tra xem có file config trong ~/.ssh/config chưa

   ```sh
   $ open ~/.ssh/config
   > The file /Users/YOU/.ssh/config does not exist.
   ```

   Nếu chưa có thì có thông báo như trên, thì mình sẽ tạo ra một file config bằng lệnh sau

   ```sh
   touch ~/.ssh/config
   ```

   sau đó lại mở file config bằng lệnh trên rồi paste đoạn config sau vào

   ```
   Host github.com
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa
   ```

   do mình đã tạo một ssh cho mail vukieuhaihoa@gmail.com rồi, nên mình không cần làm những bước trên nhé. Tuy nhiên mình sẽ config thêm cho email millomilk2022@gmail.com như sau

   ```
   Host github.com
    HostName github.com
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa
   Host github-personal
    HostName github.com
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa_millo
   ```

   1.5 Add your SSH private key to the ssh-agent and store your passphrase in the keychain. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_ed25519 in the command with the name of your private key file.

   ```sh
   ssh-add --apple-use-keychain ~/.ssh/id_rsa_millo

   ```

   1.6 Ping thử nè

   Nếu mà ra như vậy rồi thì là thành công rồi đó bà con.

   [![Screen Shot][terminal-screenshot-1]]()

<!-- USAGE EXAMPLES -->

## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_

Vâỵ bây giờ sử dụng 2 account github như thế nào đây:

Khi dùng acc vukieuhaihoa@gmail.com thì khi mình clone một dự án mình sẽ dùng lệnh:

```sh
git clone git@github.com:vukieuhaihoa/microservices-proto.git
```

Còn khi dùng acc clone thì mình sử dụng như sau:

```sh
git clone git@github-personal:codewithhoa/multi-git-account-on-laptop.git
```

Sau khi vào thư mục dự án cụ thể, thì mình sẽ config user.name user.email cụ thể bằng cách thực thi file git.config.sh như sau:

```sh
chmod a+x git.config.sh
./git.config.sh
```

Nó sẽ hiển thị ra prompt như sau:

```sh
  GIT profile:<Enter your profile you want personal or official>

```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

## Roadmap

- [x] Add Changelog
- [x] Add back to top links
- [ ] Add Additional Templates w/ Examples
- [ ] Add "components" document to easily copy & paste sections of the readme
- [ ] Multi-language Support
  - [ ] Chinese
  - [ ] Spanish

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Your Name - [@your_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/your_username/repo_name](https://github.com/your_username/repo_name)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

- [Choose an Open Source License](https://choosealicense.com)
- [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
- [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
- [Malven's Grid Cheatsheet](https://grid.malven.co/)
- [Img Shields](https://shields.io)
- [GitHub Pages](https://pages.github.com)
- [Font Awesome](https://fontawesome.com)
- [React Icons](https://react-icons.github.io/react-icons/search)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## References

ở đây là những cái mình đã tham khảo để làm nên cái repo này

- [Awesome template readme](https://github.dev/othneildrew/Best-README-Template/tree/master/images)

- [Mình tham khảo cái image ở đây](https://www.vairix.com/tech-blog/how-to-use-multiple-github-accounts-on-the-same-computer)

- [SSH generate](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

- [SSH generate](https://blog.nguyenary.dev/cach-tao-ssh-key-va-su-dung-no-voi-gitlab-va-github.html)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/codewithhoa/multi-git-account-on-laptop.svg?style=for-the-badge
[contributors-url]: https://github.com/codewithhoa/multi-git-account-on-laptop/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/codewithhoa/multi-git-account-on-laptop.svg?style=for-the-badge
[forks-url]: https://github.com/codewithhoa/multi-git-account-on-laptop/network/members
[stars-shield]: https://img.shields.io/github/stars/codewithhoa/multi-git-account-on-laptop.svg?style=for-the-badge
[stars-url]: https://github.com/codewithhoa/multi-git-account-on-laptop/stargazers
[issues-shield]: https://img.shields.io/github/issues/codewithhoa/multi-git-account-on-laptop.svg?style=for-the-badge
[issues-url]: https://github.com/codewithhoa/multi-git-account-on-laptop/issues
[iterm2.com]: https://img.shields.io/badge/iTerm2-20232A?style=for-the-badge&logo=iterm2&logoColor=white
[iterm2-url]: https://iterm2.com/
[terminal-screenshot-1]: images/screenshot-1.png
[product-screenshot]: images/multi-git-account.webp
