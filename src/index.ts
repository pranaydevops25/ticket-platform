import express from "express";

type Ticket = { id: number; title: string; priority: string };

const app = express();
app.use(express.json());

const PORT = Number(process.env.PORT) || 3000;
const tickets: Ticket[] = [];

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.get("/tickets", (req, res) => {
  res.json(tickets);
});

app.post("/tickets", (req, res) => {
  const { title, priority } = req.body ?? {};

  if (!title) {
    res.status(400).json({ error: "title is required" });
    return;
  }

  const ticket: Ticket = {
    id: tickets.length + 1,
    title,
    priority: priority ?? "medium",
  };
  tickets.push(ticket);
  res.status(201).json(ticket);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
