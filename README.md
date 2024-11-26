<h1 align="center"> <img alt="Phoenix logo" src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/phoenix/phoenix-original.svg' width="auto" height="30"> Programming Phoenix <img alt="Phoenix logo" src='https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/elixir/elixir-original.svg' width="auto" height="30"></h1>

<h3 align="center">
Repository to keep track of what i learning of Elixir and Phoenix from the book Programming Phoenix
</h3>

<p align="center"> <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/SamyrOR/programming_phoenix">
<img alt="GitHub language count" src="https://img.shields.io/github/repo-size/SamyrOR/programming_phoenix">
		<img  alt="GitHub last commit"  src="https://img.shields.io/github/last-commit/SamyrOR/programming_phoenix">
</p>
<h4 align="center">
	🚧 Done 🚀 🚧
</h4>

# Table of contents

<!--ts-->

- [Table of contents](#table-of-contents)
  - [💻 About](#-about)
  - [⚙️ Features](#️-features)
  - [🚀 Live](#-live)
  - [💡 How it works](#-how-it-works)
    - [Pre-requisites](#pre-requisites)
      - [Development server](#development-server)
      - [Build](#build)
  - [🛠 Tech stack](#-tech-stack)
  - [💪 How to contribute](#-how-to-contribute)
  <!--te-->

---

## 💻 About

I fell in love with the Elixir language, and decided to learn this.

After research i found the Programming Phoenix book, that bring awesome teaches from the masters, Chris McCord, Bruce Tate, and José Valim.

An awesome book, from where i learned fundamental concepts of both, the language, and framework.

## ⚙️ Features

- [x] Controllers
- [x] Ecto
  - [x] Changesets
  - [x] Queries
  - [x] Constraints
- [x] Plugs
- [x] Generators
- [x] Tests
- [x] Channels
- [x] Umbrellas app
- [x] OTP
  - [x] Genservers

---

## 🚀 Live

You can visit the page here [rumbl.samyr.dev](https://rumbl.samyr.dev/)

## 💡 How it works

### Pre-requisites

Ensure you have elixir language, and phoenix framework installed to run `mix deps.get && mix deps.complie` after cloning the project

#### Development server

```bash
Run `mix phx.ecto.migrate` to build up the tables on the postgress db.

Also run `mix run /apps/rumbl/priv/repo/seeds.exs`
And
mix run /apps/rumbl/priv/repo/backend_seeds.exs
To populate the db with useful info
```

```bash
Run `mix phx.server` for a dev server. Navigate to `http://localhost:4000/`. The app will automatically reload if you change any of the source files.
```

#### Build

```bash
Run `mix build` to build the project. The build artifacts will be stored in the `dist/` directory.
```

---

## 🛠 Tech stack

The following tools were used in the construction of the project:

- **[Elixir](https://elixir-lang.org/)**
- **[Mix](https://hexdocs.pm/elixir/introduction-to-mix.html)**
- **[Phoenix](https://www.phoenixframework.org/)**
- **[PostgreSQL](https://www.postgresql.org/)**
- **[TailwindCSS](https://tailwindcss.com/)**

---

## 💪 How to contribute

1. Fork the project.
2. Create a new branch with your changes: `git checkout -b my-feature`
3. Save your changes and create a commit message telling you what you did: `git commit -m" feature: My new feature "`
4. Submit your changes: `git push origin my-feature`
   > If you have any suggestion, tip or compliment, please leave a issue

---

Made with love by Samyr Ribeiro 👋🏽 [Get in Touch!](https://www.linkedin.com/in/samyr-ribeiro-82a720145/)
