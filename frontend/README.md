# MTG Card List Manager Frontend

This is the frontend application for the MTG Card List Manager. It's built with React, TypeScript, and Vite, providing a user-friendly interface for managing Magic: The Gathering card lists.

## Prerequisites

- Node.js (version 14 or later recommended)
- npm (comes with Node.js)

## Installation

1. Navigate to the frontend directory:
   ```
   cd frontend
   ```

2. Install dependencies:
   ```
   npm install
   ```

## Available Scripts

In the project directory, you can run:

### `npm run dev`

Runs the app in development mode.
Open [http://localhost:5173](http://localhost:5173) to view it in the browser.

### `npm run build`

Builds the app for production to the `dist` folder.

### `npm run lint`

Runs the linter to check for code style issues.

### `npm run preview`

Locally preview the production build.

## Project Structure

```
frontend/
├── src/
│   ├── components/
│   │   ├── CardGrid.tsx
│   │   ├── CardList.tsx
│   │   ├── CardListWrapper.tsx
│   │   ├── FileUploader.tsx
│   │   └── QRCodeGenerator.tsx
│   ├── utils/
│   │   └── csvProcessor.ts
│   ├── App.tsx
│   ├── index.css
│   ├── main.tsx
│   ├── types.ts
│   └── vite-env.d.ts
├── index.html
├── package.json
├── tsconfig.json
├── vite.config.ts
└── README.md
```

## Key Components

- **CardGrid**: Displays a grid of cards.
- **CardList**: Renders a list of cards.
- **CardListWrapper**: Wraps the card list with additional functionality.
- **FileUploader**: Handles CSV file uploads.
- **QRCodeGenerator**: Generates QR codes for sharing card lists.

## Styling

This project uses Tailwind CSS for styling. The configuration can be found in `tailwind.config.js`.

## TypeScript

The project is set up with TypeScript. The main configuration file is `tsconfig.json`.

## Building for Production

When you're ready to deploy, run `npm run build`. This will create a `dist` folder with your compiled assets. These files should be served by your backend server.

## Connecting to the Backend

The frontend is designed to work with the Flask backend. Make sure the backend server is running and that the frontend is configured to send requests to the correct URL.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.
