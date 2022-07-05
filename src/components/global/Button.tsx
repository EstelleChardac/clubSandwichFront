import React from 'react';

interface ButtonProps {
  text: string;
  className: string;
}

const Button = ({ text, className }: ButtonProps) => {
  return (
    <div className={className}>
      <div className={`${className}__h1`}>{text}</div>
    </div>
  );
};

export default Button;
