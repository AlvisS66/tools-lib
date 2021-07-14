# lib template

> 基于 `dumi` ,`father-build` , `lerna` 的多包管理仓库模板

- 代码规范检查基于 `eslint` , `prettier` , `stylelint` , 默认使用 `@umijs/fabric` 配置
- 默认子包存放在 packages 目录下, [dumi 会以 packages/[包名]/src 为基础路径搜寻所有子包的 Markdown 文档并生成路由](https://d.umijs.org/zh-CN/guide/basic#lerna-%E9%A1%B9%E7%9B%AE)
- lerna默认为 independent 模式, 即允许管理者对每个库单独改变版本号，每次发布的时候，你需要为每个改动的库指定版本号。
- 默认启用了 `workspace`, 安装依赖时请用 `yarn add <packgeName>`, 根目录下安装依赖 `yarn add <packgeName> -W`

---

## `dumi`

> 文档生成工具

- 执行 `dumi dev` 命令本地开发
- 执行 `dumi build` 命令后打包生成 `docs-dist` 文件夹,并可配合 `gh-pages` 工具发布到 github.io

```ts
//.umirc.ts 相关配置项修改
  {
    outputPath: 'docs-dist', // 输出路径
    mode: 'site', // 文档展现模式
    // ... 更多配置请阅读文档 https://d.umijs.org/config
  }
```

---

## `father-build`

> 基于 rollup , babel 的 打包工具

- `father-build` 命令后会在各子包下生成相应的 dist 或者 lib 文件夹
- 各子包独立的 `.fatherrc.ts` 会继承根目录下的 `.fatherrc.ts` 配置

```ts
// .fatherrc.ts 相关配置项修改
  {
    esm: 'rollup',
    cjs: 'rollup',
    // ... 更多配置请阅读文档 https://github.com/umijs/father
  }
```

---

## `lerna`

> 多包管理工具

- 执行 `lerna bootstrap` 命令会把各子包代码库进行 link
- 执行 `lerna publish` 发布最新改动的库
- `lerna run xxx` 命令会执行各子包下 `npm run xxx`

```json
// lerna.json 相关配置项修改
{
   "packages": ["packages/*"], // 指定包所在的目录
   "command": {
      "publish": {
        "registry": "https://registry.npmjs.org/" // publish 的地址
      }
    },
    // ... 更多配置请阅读文档 https://github.com/lerna/lerna
}
```

---

## `Code Commit Conventions`

> 使用 commitlint 和 commitizen 来规范代码库的提交说明

> 提交规范可参考 [Cz工具集使用介绍 - 规范Git提交说明](https://juejin.cn/post/6844903831893966856#heading-1)

- `commitlint` 校验 commit说明

```json
// 使用 commitlint
{
  "gitHooks": {
    "commit-msg": "commitlint -E GIT_PARAMS"
  },
}
```

```js
// .commitlintrc.js 配置校验文件 
// 详细配置项请看 https://commitlint.js.org/#/

```

- 默认使用 `cz-customizable` 插件可自定义配置 commitizen 的 commit 提示语

```js
// .cz-config.js 配置文件
// 详细配置项请看 https://github.com/leoforfree/cz-customizable
```

#### commitizen 使用

直接运行

```bash
$ npm run commit
```

`or`

git中

需先全局安装 commitizen 后

```
$ npm install commitizen -g
```

执行

```bash
git cz
```

`or`

vscode 中使用

安装 [Visual Studio Code Commitizen Support](https://marketplace.visualstudio.com/items?itemName=KnisterPeter.vscode-commitizen)  插件后参照使用说明

_Open the command panel (`ctrl+shift+p` or `command+shift+p`) and type '`conventional commit`'_

---

## `Usage`

Init library

```bash
$ npm run init
```

Publish library ( 发布前请先注册并登陆 [npm](https://www.npmjs.com/) 账号 )

```bash
$ npm run pub 
```

Install dependencies,

```bash
$ yarn install
```

Start the dev server,

```bash
$ npm start
```

Build documentation,

```bash
$ npm run docs:build
```

Build library via `father-build`,

```bash
$ npm run build
```
Commit
```bash
$ npm run commit
```

---

## `Reference`

- [dumi](https://d.umijs.org/zh-CN)
- [father-build](https://github.com/umijs/father)
- [lerna](https://github.com/lerna/lerna)
- [commitlint](https://github.com/conventional-changelog/commitlint#readme)
- [commitizen](http://commitizen.github.io/cz-cli/)
- [gh-pages](https://github.com/tschaub/gh-pages)

---
