"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.models = exports.sequelize = void 0;
const sequelize_typescript_1 = require("sequelize-typescript");
const path = require("path");
const chat_1 = require("./ts/chat");
const contact_1 = require("./ts/contact");
const invite_1 = require("./ts/invite");
const message_1 = require("./ts/message");
const subscription_1 = require("./ts/subscription");
const mediaKey_1 = require("./ts/mediaKey");
const chatMember_1 = require("./ts/chatMember");
const timer_1 = require("./ts/timer");
const bot_1 = require("./ts/bot");
const chatBot_1 = require("./ts/chatBot");
const botMember_1 = require("./ts/botMember");
const accounting_1 = require("./ts/accounting");
const env = process.env.NODE_ENV || 'development';
const config = require(path.join(__dirname, '../../config/config.json'))[env];
const sequelize = new sequelize_typescript_1.Sequelize(Object.assign(Object.assign({}, config), { logging: process.env.SQL_LOG === 'true' ? console.log : false, models: [chat_1.default, contact_1.default, invite_1.default, message_1.default, subscription_1.default, mediaKey_1.default, chatMember_1.default, timer_1.default, bot_1.default, chatBot_1.default, botMember_1.default, accounting_1.default] }));
exports.sequelize = sequelize;
const models = sequelize.models;
exports.models = models;
//# sourceMappingURL=index.js.map