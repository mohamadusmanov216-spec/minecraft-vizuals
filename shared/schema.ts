import { z } from "zod";

export const modConfigSchema = z.object({
  trailColor: z.object({
    r: z.number().min(0).max(255),
    g: z.number().min(0).max(255),
    b: z.number().min(0).max(255),
  }),
  hitboxColor: z.object({
    r: z.number().min(0).max(255),
    g: z.number().min(0).max(255),
    b: z.number().min(0).max(255),
  }),
  hitEffectColor: z.object({
    r: z.number().min(0).max(255),
    g: z.number().min(0).max(255),
    b: z.number().min(0).max(255),
  }),
  showTrail: z.boolean(),
  showHitbox: z.boolean(),
  showHitEffects: z.boolean(),
  hitboxMultiplier: z.number().min(1.0).max(2.0),
  hatStyle: z.enum(["NONE", "CROWN", "AURA", "WINGS", "HALO"]),
});

export type ModConfig = z.infer<typeof modConfigSchema>;
