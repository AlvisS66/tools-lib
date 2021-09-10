{
  "private": true,
  "name": "tools-lib",
  "version": "1.0.0",
  "workspaces": [
    "packages/*"
  ],
  "scripts": {
    "init": "rm -rf node_modules && yarn install && npm run clean && npm run bootstrap && npm run build",
    "start": "dumi dev",
    "bootstrap": "lerna bootstrap",
    "docs:build": "dumi build",
    "docs:deploy": "gh-pages -d docs-dist",
    "clean": "lerna clean --yes",
    "build:lerna": "lerna run build",
    "build": "father-build",
    "build:no-lerna": "cross-env LERNA=none father-build",
    "build:demo": "cross-env PACKAGE=demo father-build",
    "deploy": "npm run docs:build && npm run docs:deploy",
    "release": "npm run build && npm run pub",
    "pub": "lerna publish",
    "login:npm": "npm login",
    "logout:npm": "npm logout",
    "prettier": "prettier --write \"**/*.{js,jsx,tsx,ts,less,md,json}\"",
    "lint:ts": "eslint --ignore-pattern **/__tests__/* --ignore-pattern **/demo/* \"packages/*/src/**/*.{ts,tsx}\"",
    "test": "umi-test",
    "test:coverage": "umi-test --coverage",
    "commit": "cz",
    "changelog": "conventional-changelog -p angular -i CHANGELOG.md -s -r 0",
    "lerna:changelog": "cross-env GITHUB_AUTH=xxx lerna-changelog"
  },
  "gitHooks": {
    "pre-commit": "lint-staged",
    "commit-msg": "commitlint -E GIT_PARAMS"
  },
  "lint-staged": {
    "*.{js,jsx,less,md,json}": [
      "prettier --write"
    ],
    "*.ts?(x)": [
      "prettier --parser=typescript --write"
    ],
    "packages/*/src/**/*.{js,jsx,ts,tsx}": "npm run lint:ts"
  },
  "devDependencies": {
    "@commitlint/cli": "^12.1.4",
    "@commitlint/config-conventional": "^12.1.4",
    "@types/jest": "^24.0.13",
    "@umijs/fabric": "^2.5.7",
    "@umijs/test": "^3.0.5",
    "commitizen": "^4.2.4",
    "conventional-changelog-cli": "^2.1.1",
    "cross-env": "^7.0.3",
    "cz-conventional-changelog": "^3.3.0",
    "cz-customizable": "^6.3.0",
    "dumi": "^1.1.20",
    "eslint": "^7.28.0",
    "father-build": "^1.19.6",
    "gh-pages": "^3.0.0",
    "lerna": "^4.0.0",
    "lerna-changelog": "^2.1.0",
    "lint-staged": "^10.0.7",
    "prettier": "^2.2.0",
    "react": "17.x",
    "react-dom": "17.x",
    "rimraf": "^3.0.2",
    "stylelint": "^13.13.0",
    "yorkie": "^2.0.0"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/AlvisS66/tools-lib.git"
  },
  "publishConfig": {
    "access": "public"
  },
  "config": {
    "commitizen": {
      "path": "./node_modules/cz-customizable"
    }
  }
}
