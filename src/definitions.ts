export interface CapacitorMetaSdkPlugin {
  logEvent(options: { eventName: string; eventValues?: Record<string, any> }): Promise<void>;
}
