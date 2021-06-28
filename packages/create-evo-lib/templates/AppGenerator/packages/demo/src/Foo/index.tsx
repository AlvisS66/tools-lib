import React from 'react';
import { Typography } from 'antd';

export default ({ title }: { title: string }) => (
  <Typography.Paragraph>{title}</Typography.Paragraph>
);
