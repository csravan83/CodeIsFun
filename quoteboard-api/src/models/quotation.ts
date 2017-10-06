import { model, Document, Schema, SchemaTypes } from "mongoose";

// Definition of our quotation object
export interface QuotationDocument extends Document {
  id: string;
  quote: string;
  createdAt: Date;
  updatedAt: Date;
}

const quotationSchema = new Schema({
  quote: {type: SchemaTypes.String, require: true}
}, { timestamps: true });

export const Quotation = model<QuotationDocument>("Quotation", quotationSchema);
