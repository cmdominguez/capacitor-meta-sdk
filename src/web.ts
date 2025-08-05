import { WebPlugin } from '@capacitor/core';

import type { CapacitorMetaSdkPlugin } from './definitions';

export class CapacitorMetaSdkWeb extends WebPlugin implements CapacitorMetaSdkPlugin {
  async logEvent(options: { eventName: string; eventValues?: Record<string, any> }): Promise<void> {
    console.log(`Event logged: ${options.eventName}`, options.eventValues);
  }
}
