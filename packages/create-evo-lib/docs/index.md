# lib template

## 基于 `dumi` `father-build` `lerna` 的多包管理仓库模板
- 代码规范检查基于 `eslint` `prettier` `stylelint`，默认使用 `@umijs/fabric` 配置
- 默认子包存放在 packages 目录下, [dumi 会以 packages/[包名]/src 为基础路径搜寻所有子包的 Markdown 文档并生成路由](https://d.umijs.org/zh-CN/guide/basic#lerna-%E9%A1%B9%E7%9B%AE)
- lerna默认为 independent 模式, 即允许管理者对每个库单独改变版本号，每次发布的时候，你需要为每个改动的库指定版本号。

### dumi
> `文档生成工具`
```typescript
//.umirc.ts 相关配置修改
  outputPath: 'docs-dist',
  mode: 'site', // 文档展现模式
  // ...
```
### father-build
> `基于 rollup babel 的 打包工具` 
- father-build 命令后会在各子包下生成相应的 dist 或者 lib 文件夹

```typescript
// .fatherrc.ts 相关配置修改
  esm: 'rollup',
  cjs: 'rollup',
  // ...
```

### lerna
> `多包管理工具`
- 通过 lerna bootstrap 命令将会把代码库进行 link。
- 通过 lerna publish 发布最新改动的库
```json
// lerna.json 相关配置修改
{
   "packages": ["packages/*"], // 指定包所在的目录
   "command": {
      "publish": {
        "registry": "https://registry.npmjs.org/" // publish 的地址
      }
    },
    // ...
}
```

### Usage
Init library

```bash
$ npm run init
```

Publish library

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

### Code Commit Conventions


## Reference
- [dumi](https://d.umijs.org/zh-CN)
- [father-build](https://github.com/umijs/father)
- [lerna](https://github.com/lerna/lerna#readme)

