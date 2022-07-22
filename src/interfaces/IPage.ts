export default interface IPage {
  id: number;
  title?: string;
  subTitle?: string;
  description?: string;
  image1?: string;
  image2?: string;
  image3?: string;
  backgroundImg?: string;
  createdDate?: Date;
  website?: string;
  idUser?: number;
  idSupplier?: number;
  idAddress?: number;
  idPageType?: number;
  author?: string;
}
