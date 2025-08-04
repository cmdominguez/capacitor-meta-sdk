export interface CapacitorMetaSdkPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
