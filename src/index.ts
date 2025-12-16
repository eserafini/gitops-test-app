import express, { Request, Response } from "express";

const app = express();
const PORT = process.env.PORT || 3000;
const VERSION = process.env.VERSION || "1.0.0";

app.use(express.json());

// Health check endpoint
app.get("/health", (req: Request, res: Response) => {
  res.json({
    status: "healthy",
    version: VERSION,
    timestamp: new Date().toISOString(),
  });
});

// Root endpoint
app.get("/", (req: Request, res: Response) => {
  res.json({
    message: "GitOps Test App is running!",
    version: VERSION,
    environment: process.env.NODE_ENV || "development",
  });
});

// Example API endpoint
app.get("/api/hello", (req: Request, res: Response) => {
  res.json({
    message: "Hello from GitOps Test App!",
    version: VERSION,
  });
});

app.listen(PORT, () => {
  console.log(`GitOps Test App v${VERSION} listening on port!!!!! ${PORT}`);
  console.log(`Environment: ${process.env.NODE_ENV || "development"}`);
});
