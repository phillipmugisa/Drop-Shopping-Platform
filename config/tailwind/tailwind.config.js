/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    '../../templates/*.html',
  ],
  theme: {
    screens: {
        // sm: '480px',
        // md: '768px',
        // lg: '976px',
        // xl: '1440px',
    },
    extend: {
        colors: {
          "primaryColor": "hsl(0, 0%, 98%)",
          "secondaryColor": "hsl(0, 0%, 100%)",
          "accentColor": "hsl(0, 0%, 0%)",
        },
        width: {
        },
        gridTemplateRows: {
        }
    }
},
  plugins: [
    require('@tailwindcss/typography'),
  ],
}